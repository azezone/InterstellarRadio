using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using SOVR.Android;

/// <summary>
/// A head-tracked stereoscopic virtual reality camera rig.
/// </summary>
[ExecuteInEditMode]
public class SOVRCameraRig : MonoBehaviour
{
    /// <summary>
    /// The left eye camera.
    /// </summary>
    public Camera leftEyeCamera { get; private set; }
    /// <summary>
    /// The right eye camera.
    /// </summary>
    public Camera rightEyeCamera { get; private set; }
    /// <summary>
    /// Provides a root transform for all anchors in tracking space.
    /// </summary>
    public Transform trackingSpace { get; private set; }
    /// <summary>
    /// Always coincides with the pose of the left eye.
    /// </summary>
    public Transform leftEyeAnchor { get; private set; }
    /// <summary>
    /// Always coincides with average of the left and right eye poses.
    /// </summary>
    public Transform centerEyeAnchor { get; private set; }
    /// <summary>
    /// Always coincides with the pose of the right eye.
    /// </summary>
    public Transform rightEyeAnchor { get; private set; }
    /// <summary>
    /// Always coincides with the pose of the tracker.
    /// </summary>
    public Transform trackerAnchor { get; private set; }
    /// <summary>
    /// Occurs when the eye pose anchors have been set.
    /// </summary>
    public event System.Action<SOVRCameraRig> UpdatedAnchors;

    private bool needsCameraConfigure;
    private readonly string trackingSpaceName = "TrackingSpace";
    private readonly string trackerAnchorName = "TrackerAnchor";
    private readonly string eyeAnchorName = "EyeAnchor";
    private readonly string legacyEyeAnchorName = "Camera";

    private float offsetCameraRot = 2.0f;

    #region Unity Messages
    private void Awake()
    {
        EnsureGameObjectIntegrity();

        if (!Application.isPlaying)
            return;

        needsCameraConfigure = true;

        SOVRManager.NativeTextureScaleModified += (prev, current) => { needsCameraConfigure = true; };
        SOVRManager.VirtualTextureScaleModified += (prev, current) => { needsCameraConfigure = true; };
        SOVRManager.EyeTextureAntiAliasingModified += (prev, current) => { needsCameraConfigure = true; };
        SOVRManager.EyeTextureDepthModified += (prev, current) => { needsCameraConfigure = true; };
        SOVRManager.EyeTextureFormatModified += (prev, current) => { needsCameraConfigure = true; };
        SOVRManager.MonoscopicModified += (prev, current) => { needsCameraConfigure = true; };
        SOVRManager.HdrModified += (prev, current) => { needsCameraConfigure = true; };
    }

    private void Start()
    {
        EnsureGameObjectIntegrity();

        if (!Application.isPlaying)
            return;

        UpdateCameras();
        UpdateAnchors();
    }

#if !UNITY_ANDROID || UNITY_EDITOR
    private void LateUpdate()
#else
	private void Update()
#endif
    {
        EnsureGameObjectIntegrity();

        if (!Application.isPlaying)
            return;

        UpdateCameras();
        UpdateAnchors();
    }

    #endregion

    private void UpdateAnchors()
    {
        bool monoscopic = SOVRManager.instance.monoscopic;

        SOVRPose tracker = SOVRManager.tracker.GetPose();
        SOVRPose hmdLeftEye = SOVRManager.display.GetEyePose(SOVREye.Left);
        SOVRPose hmdRightEye = SOVRManager.display.GetEyePose(SOVREye.Right);

        trackerAnchor.localRotation = tracker.orientation;
        centerEyeAnchor.localRotation = hmdLeftEye.orientation; // using left eye for now
        leftEyeAnchor.localRotation = monoscopic ? centerEyeAnchor.localRotation : hmdLeftEye.orientation;
        rightEyeAnchor.localRotation = monoscopic ? centerEyeAnchor.localRotation : hmdRightEye.orientation;

        trackerAnchor.localPosition = tracker.position;
        centerEyeAnchor.localPosition = 0.5f * (hmdLeftEye.position + hmdRightEye.position);
        leftEyeAnchor.localPosition = monoscopic ? centerEyeAnchor.localPosition : hmdLeftEye.position;
        rightEyeAnchor.localPosition = monoscopic ? centerEyeAnchor.localPosition : hmdRightEye.position;

        // Set camera's Y axis rotation offset for 3d stereo
        leftEyeAnchor.transform.Rotate(0.0f, offsetCameraRot, 0.0f);
        rightEyeAnchor.transform.Rotate(0.0f, -offsetCameraRot, 0.0f);

        if (UpdatedAnchors != null)
        {
            UpdatedAnchors(this);
        }
    }

    private void UpdateCameras()
    {
        if (needsCameraConfigure)
        {
            leftEyeCamera = ConfigureCamera(SOVREye.Left);
            rightEyeCamera = ConfigureCamera(SOVREye.Right);
        }
    }

    public void EnsureGameObjectIntegrity()
    {
        if (trackingSpace == null)
            trackingSpace = ConfigureRootAnchor(trackingSpaceName);

        if (leftEyeAnchor == null)
            leftEyeAnchor = ConfigureEyeAnchor(trackingSpace, SOVREye.Left);

        if (centerEyeAnchor == null)
            centerEyeAnchor = ConfigureEyeAnchor(trackingSpace, SOVREye.Center);

        if (rightEyeAnchor == null)
            rightEyeAnchor = ConfigureEyeAnchor(trackingSpace, SOVREye.Right);

        if (trackerAnchor == null)
            trackerAnchor = ConfigureTrackerAnchor(trackingSpace);

        if (leftEyeCamera == null)
        {
            leftEyeCamera = leftEyeAnchor.GetComponent<Camera>();
            if (leftEyeCamera == null)
            {
                leftEyeCamera = leftEyeAnchor.gameObject.AddComponent<Camera>();
            }
#if UNITY_ANDROID && !UNITY_EDITOR
			if (leftEyeCamera.GetComponent<SOVRPostRender>() == null)
			{
				leftEyeCamera.gameObject.AddComponent<SOVRPostRender>();
			}
#endif
        }

        if (rightEyeCamera == null)
        {
            rightEyeCamera = rightEyeAnchor.GetComponent<Camera>();
            if (rightEyeCamera == null)
            {
                rightEyeCamera = rightEyeAnchor.gameObject.AddComponent<Camera>();
            }
#if UNITY_ANDROID && !UNITY_EDITOR
			if (rightEyeCamera.GetComponent<SOVRPostRender>() == null)
			{
				rightEyeCamera.gameObject.AddComponent<SOVRPostRender>();
			}
#endif
        }
    }

    private Transform ConfigureRootAnchor(string name)
    {
        Transform root = transform.Find(name);

        if (root == null)
        {
            root = new GameObject(name).transform;
        }

        root.parent = transform;
        root.localScale = Vector3.one;
        root.localPosition = Vector3.zero;
        root.localRotation = Quaternion.identity;

        return root;
    }

    private Transform ConfigureEyeAnchor(Transform root, SOVREye eye)
    {
        string name = eye.ToString() + eyeAnchorName;
        Transform anchor = transform.Find(root.name + "/" + name);

        if (anchor == null)
        {
            anchor = transform.Find(name);
        }

        if (anchor == null)
        {
            string legacyName = legacyEyeAnchorName + eye.ToString();
            anchor = transform.Find(legacyName);
        }

        if (anchor == null)
        {
            anchor = new GameObject(name).transform;
        }

        anchor.name = name;
        anchor.parent = root;
        anchor.localScale = Vector3.one;
        anchor.localPosition = Vector3.zero;
        anchor.localRotation = Quaternion.identity;

        return anchor;
    }

    private Transform ConfigureTrackerAnchor(Transform root)
    {
        string name = trackerAnchorName;
        Transform anchor = transform.Find(root.name + "/" + name);

        if (anchor == null)
        {
            anchor = new GameObject(name).transform;
        }

        anchor.parent = root;
        anchor.localScale = Vector3.one;
        anchor.localPosition = Vector3.zero;
        anchor.localRotation = Quaternion.identity;

        return anchor;
    }

    private Camera ConfigureCamera(SOVREye eye)
    {
        Transform anchor = (eye == SOVREye.Left) ? leftEyeAnchor : rightEyeAnchor;
        Camera cam = anchor.GetComponent<Camera>();

        SOVRDisplay.EyeRenderDesc eyeDesc = SOVRManager.display.GetEyeRenderDesc(eye);

        cam.fieldOfView = eyeDesc.fov.y;
        cam.aspect = eyeDesc.resolution.x / eyeDesc.resolution.y;
        cam.rect = new Rect(0f, 0f, SOVRManager.instance.virtualTextureScale, SOVRManager.instance.virtualTextureScale);
        cam.targetTexture = SOVRManager.display.GetEyeTexture(eye);
        cam.hdr = SOVRManager.instance.hdr;

#if UNITY_ANDROID && !UNITY_EDITOR
		// Enforce camera render order
		cam.depth = (eye == SOVREye.Left) ?
				(int)RenderEventType.LeftEyeEndFrame :
				(int)RenderEventType.RightEyeEndFrame;

		// If we don't clear the color buffer with a glClear, tiling GPUs
		// will be forced to do an "unresolve" and read back the color buffer information.
		// The clear is free on PowerVR, and possibly Mali, but it is a performance cost
		// on Adreno, and we would be better off if we had the ability to discard/invalidate
		// the color buffer instead of clearing.

		// NOTE: The color buffer is not being invalidated in skybox mode, forcing an additional,
		// wasted color buffer read before the skybox is drawn.
		bool hasSkybox = ((cam.clearFlags == CameraClearFlags.Skybox) &&
		                 ((cam.gameObject.GetComponent<Skybox>() != null) || (RenderSettings.skybox != null)));
		cam.clearFlags = (hasSkybox) ? CameraClearFlags.Skybox : CameraClearFlags.SolidColor;
#endif

        // When rendering monoscopic, we will use the left camera render for both eyes.
        if (eye == SOVREye.Right)
        {
            cam.enabled = !SOVRManager.instance.monoscopic;
        }

        // AA is documented to have no effect in deferred, but it causes black screens.
        if (cam.actualRenderingPath == RenderingPath.DeferredLighting)
            QualitySettings.antiAliasing = 0;

        return cam;
    }

    // Set Camera's stereo vision
    public void SetCameraStereoVision(float offset)
    {
        offsetCameraRot = offset;
    }
}
