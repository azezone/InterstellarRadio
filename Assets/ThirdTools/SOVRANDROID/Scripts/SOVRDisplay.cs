using System;
using System.Runtime.InteropServices;
using UnityEngine;
using SOVR;

/// <summary>
/// Manages an SOVR display.
/// </summary>
public class SOVRDisplay
{
    /// <summary>
    /// Specifies the size and field-of-view for one eye texture.
    /// </summary>
    public struct EyeRenderDesc
    {
        /// <summary>
        /// The horizontal and vertical size of the texture.
        /// </summary>
        public Vector2 resolution;

        /// <summary>
        /// The angle of the horizontal and vertical field of view in degrees.
        /// </summary>
        public Vector2 fov;
    }

    /// <summary>
    /// Contains latency measurements for a single frame of rendering.
    /// </summary>
    public struct LatencyData
    {
        /// <summary>
        /// The time it took to render both eyes in seconds.
        /// </summary>
        public float render;

        /// <summary>
        /// The time it took to perform TimeWarp in seconds.
        /// </summary>
        public float timeWarp;

        /// <summary>
        /// The time between the end of TimeWarp and scan-out in seconds.
        /// </summary>
        public float postPresent;
        public float renderError;
        public float timeWarpError;
    }

    /// <summary>
    /// If true, a physical HMD is attached to the system.
    /// </summary>
    /// <value><c>true</c> if is present; otherwise, <c>false</c>.</value>
    public bool isPresent
    {
        get
        {
#if UNITY_ANDROID && !UNITY_EDITOR
			return SOVR_IsHMDPresent();			
#endif
            return false;
        }
    }

    private int prevAntiAliasing;
    private int prevScreenWidth;
    private int prevScreenHeight;
    private bool needsConfigureTexture;
    private bool needsSetTexture;
    private bool needsSetDistortionCaps;
    private bool prevFullScreen;
    private SOVRPose[] eyePoses = new SOVRPose[(int)SOVREye.Count];
    private EyeRenderDesc[] eyeDescs = new EyeRenderDesc[(int)SOVREye.Count];
    private RenderTexture[] eyeTextures = new RenderTexture[eyeTextureCount];
    private int[] eyeTextureIds = new int[eyeTextureCount];
    private int currEyeTextureIdx = 0;


#if !UNITY_ANDROID && !UNITY_EDITOR
	private bool needsSetViewport;
#endif

#if UNITY_ANDROID && !UNITY_EDITOR
	private const int eyeTextureCount = 3 * (int)SOVREye.Count; // triple buffer
#else
    private const int eyeTextureCount = 1 * (int)SOVREye.Count;
#endif

#if UNITY_ANDROID && !UNITY_EDITOR
	private int nextEyeTextureIdx = 0;
#endif

    /// <summary>
    /// Creates an instance of SOVRDisplay. Called by SOVRManager.
    /// </summary>
    public SOVRDisplay()
    {
#if !UNITY_ANDROID || UNITY_EDITOR
        needsConfigureTexture = false;
        needsSetTexture = true;
        needsSetDistortionCaps = true;
        prevFullScreen = Screen.fullScreen;
#elif !UNITY_ANDROID && !UNITY_EDITOR
		needsSetViewport = true;
#endif

        ConfigureEyeDesc(SOVREye.Left);
        ConfigureEyeDesc(SOVREye.Right);

        for (int i = 0; i < eyeTextureCount; i += 2)
        {
            ConfigureEyeTexture(i, SOVREye.Left);
            ConfigureEyeTexture(i, SOVREye.Right);
        }

        SOVRManager.NativeTextureScaleModified += (prev, current) => { needsConfigureTexture = true; };
        SOVRManager.EyeTextureAntiAliasingModified += (prev, current) => { needsConfigureTexture = true; };
        SOVRManager.EyeTextureDepthModified += (prev, current) => { needsConfigureTexture = true; };
        SOVRManager.EyeTextureFormatModified += (prev, current) => { needsConfigureTexture = true; };

        SOVRManager.VirtualTextureScaleModified += (prev, current) => { needsSetTexture = true; };
        SOVRManager.MonoscopicModified += (prev, current) => { needsSetTexture = true; };

        SOVRManager.HdrModified += (prev, current) => { needsSetDistortionCaps = true; };
    }

    /// <summary>
    /// Updates the internal state of the SOVRDisplay. Called by SOVRManager.
    /// </summary>
    public void Update()
    {
        //UpdateDistortionCaps();
        //UpdateViewport();
        UpdateTextures();
    }

    /// <summary>
    /// Gets the head pose at the current time or predicted at the given time.
    /// </summary>
    public SOVRPose GetHeadPose(double predictionTime = 0d)
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		float px = 0.0f, py = 0.0f, pz = 0.0f, ow = 0.0f, ox = 0.0f, oy = 0.0f, oz = 0.0f;

		double atTime = Time.time + predictionTime;
		SOVR_GetCameraPositionOrientation(ref  px, ref  py, ref  pz,
									     ref  ox, ref  oy, ref  oz, ref  ow, atTime);

		return new SOVRPose
		{
			position = new Vector3(px, py, -pz),
			orientation = new Quaternion(-ox, -oy, oz, ow),
		};
#else
        float px = 0.0f, py = 0.0f, pz = 0.0f;

        return new SOVRPose
        {
            position = new Vector3(px, py, -pz),
            orientation = new Quaternion(-0, -0, 0, 0),
        };
#endif
    }

#if UNITY_ANDROID && !UNITY_EDITOR
	private float w = 0.0f, x = 0.0f, y = 0.0f, z = 0.0f, fov = 90.0f;    
#endif

    public double predictTime = 0d;

    /// <summary>
    /// Gets the pose of the given eye, predicted for the time when the current frame will scan out.
    /// </summary>
    public SOVRPose GetEyePose(SOVREye eye)
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		if (eye == SOVREye.Left)
			SOVR_GetSensorState(
					SOVRManager.instance.monoscopic,
				   	ref w,
				   	ref x,
				   	ref y,
				   	ref z,
				   	ref fov,
				   	ref SOVRManager.timeWarpViewNumber,
                    ref predictTime);

		Quaternion rot = new Quaternion(-x, -y, z, w);

		float eyeOffsetX = 0.5f * SOVRManager.profile.ipd;
		eyeOffsetX = (eye == SOVREye.Left) ? -eyeOffsetX : eyeOffsetX;

		float neckToEyeHeight = SOVRManager.profile.eyeHeight - SOVRManager.profile.neckHeight;
		Vector3 headNeckModel = new Vector3(0.0f, neckToEyeHeight, SOVRManager.profile.eyeDepth);
		Vector3 pos = rot * (new Vector3(eyeOffsetX, 0.0f, 0.0f) + headNeckModel);
		
		// Subtract the HNM pivot to avoid translating the camera when level
		pos -= headNeckModel;

		return new SOVRPose
		{
			position = pos,
			orientation = rot,
		};
#endif
        return new SOVRPose
        {
            position = new Vector3(0, 0, 0),
            orientation = new Quaternion(0, 0, 0, 0),
        };
    }

    /// <summary>
    /// Gets the given eye's projection matrix.
    /// </summary>
    /// <param name="eyeId">Specifies the eye.</param>
    /// <param name="nearClip">The distance to the near clipping plane.</param>
    /// <param name="farClip">The distance to the far clipping plane.</param>
    public Matrix4x4 GetProjection(int eyeId, float nearClip, float farClip)
    {
        return new Matrix4x4();
    }

    /// <summary>
    /// Occurs when the head pose is reset.
    /// </summary>
    public event System.Action RecenteredPose;

    /// <summary>
    /// Recenters the head pose.
    /// </summary>
    public void RecenterPose()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		SOVR_ResetSensorOrientation();
#endif

        if (RecenteredPose != null)
        {
            RecenteredPose();
        }
    }

    /// <summary>
    /// Only recenters the head yaw pose.
    /// </summary>
    public void RecenterPoseYaw()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		SOVR_ResetSensorYaw();
#endif
    }

    /// <summary>
    /// Gets the current acceleration of the head.
    /// </summary>
    public Vector3 acceleration
    {
        get
        {
#if UNITY_ANDROID && !UNITY_EDITOR
            float x = 0.0f, y = 0.0f, z = 0.0f;
			SOVR_GetAcceleration(ref x, ref y, ref z);
			return new Vector3(x, y, z);
#endif
            return new Vector3(0, 0, 0);
        }
    }

    /// <summary>
    /// Gets the current angular velocity of the head.
    /// </summary>
    public Vector3 angularVelocity
    {
        get
        {
#if UNITY_ANDROID && !UNITY_EDITOR
			float x = 0.0f, y = 0.0f, z = 0.0f;
			SOVR_GetAngularVelocity(ref x, ref y, ref z);
			return new Vector3(x, y, z);
#endif
            return new Vector3(0, 0, 0);
        }
    }

    /// <summary>
    /// Gets the resolution and field of view for the given eye.
    /// </summary>
    public EyeRenderDesc GetEyeRenderDesc(SOVREye eye)
    {
        return eyeDescs[(int)eye];
    }

    /// <summary>
    /// Gets the currently active render texture for the given eye.
    /// </summary>
    public RenderTexture GetEyeTexture(SOVREye eye)
    {
        return eyeTextures[currEyeTextureIdx + (int)eye];
    }

    /// <summary>
    /// Gets the currently active render texture's native ID for the given eye.
    /// </summary>
    public int GetEyeTextureId(SOVREye eye)
    {
        return eyeTextureIds[currEyeTextureIdx + (int)eye];
    }

    /// <summary>
    /// True if the direct mode display driver is active.
    /// </summary>
    public bool isDirectMode
    {
        get
        {
            return false;
        }
    }

    /// <summary>
    /// If true, direct mode rendering will also show output in the main window.
    /// </summary>
    public bool mirrorMode
    {
        get
        {
            return false;
        }
    }

    /// <summary>
    /// Gets the current measured latency values.
    /// </summary>
    public LatencyData latency
    {
        get
        {
            return new LatencyData
            {
                render = 0.0f,
                timeWarp = 0.0f,
                postPresent = 0.0f,
                renderError = 0.0f,
                timeWarpError = 0.0f,
            };
        }
    }

    private void UpdateTextures()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
    	for (int i = 0; i < eyeTextureCount; i++)
        {
            if (!eyeTextures[i].IsCreated())
            {
                eyeTextures[i].Create();
                eyeTextureIds[i] = eyeTextures[i].GetNativeTextureID();

            }
        }

		currEyeTextureIdx = nextEyeTextureIdx;
		nextEyeTextureIdx = (nextEyeTextureIdx + 2) % eyeTextureCount;
#endif
    }

    private void ConfigureEyeDesc(SOVREye eye)
    {
        Vector2 texSize = Vector2.zero;
        Vector2 fovSize = Vector2.zero;

#if UNITY_ANDROID && !UNITY_EDITOR
		texSize = new Vector2(1024, 1024) * SOVRManager.instance.nativeTextureScale;
		fovSize = new Vector2(90, 90);
#endif

        eyeDescs[(int)eye] = new EyeRenderDesc()
        {
            resolution = texSize,
            fov = fovSize
        };
    }

    private void ConfigureEyeTexture(int eyeBufferIndex, SOVREye eye)
    {
#if !UNITY_EDITOR
        int eyeIndex = eyeBufferIndex + (int)eye;
        EyeRenderDesc eyeDesc = eyeDescs[(int)eye];

        eyeTextures[eyeIndex] = new RenderTexture(
            (int)eyeDesc.resolution.x,
            (int)eyeDesc.resolution.y,
            (int)SOVRManager.instance.eyeTextureDepth,
            SOVRManager.instance.eyeTextureFormat);

        eyeTextures[eyeIndex].antiAliasing = (int)SOVRManager.instance.eyeTextureAntiAliasing;

        eyeTextures[eyeIndex].Create();
        eyeTextureIds[eyeIndex] = (int)eyeTextures[eyeIndex].GetNativeTexturePtr();
#endif
    }

    public void SetViewport(int x, int y, int w, int h)
    {

    }

    private const string LibSOVR = "Integration";

#if UNITY_ANDROID && !UNITY_EDITOR
	//TODO: Get rid of these functions and implement SOVR.CAPI.Hmd on Android.

	[DllImport(LibSOVR)]
	private static extern bool SOVR_ResetSensorOrientation();
    [DllImport(LibSOVR)]
	private static extern bool SOVR_ResetSensorYaw();
	[DllImport(LibSOVR)]
	private static extern bool SOVR_GetAcceleration(ref float x, ref float y, ref float z);
	[DllImport(LibSOVR)]
	private static extern bool SOVR_GetAngularVelocity(ref float x, ref float y, ref float z);
	[DllImport(LibSOVR)]
	private static extern bool SOVR_IsHMDPresent();
	[DllImport(LibSOVR)]
	private static extern bool SOVR_GetCameraPositionOrientation(
		ref float px,
		ref float py,
		ref float pz,
		ref float ox,
		ref float oy,
		ref float oz,
		ref float ow,
		double atTime);
	[DllImport(LibSOVR)]
	private static extern bool SOVR_GetSensorState(
		bool monoscopic,
		ref float w,
		ref float x,
		ref float y,
		ref float z,
		ref float fov,
		ref int viewNumber,
        ref double predictTime);
#endif
}
