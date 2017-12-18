using System;
using System.Collections;
using System.Runtime.InteropServices;
using System.Linq;
using System.Text.RegularExpressions;
using System.Text;
using UnityEngine;
using SOVR;
using SOVR.Android;

/// <summary>
/// Configuration data for DX virtual reality.
/// </summary>
public class SOVRManager : MonoBehaviour
{
    /// <summary>
    /// Contains information about the user's preferences and body dimensions.
    /// </summary>
    public struct Profile
    {
        public float ipd;
        public float eyeHeight;
        public float eyeDepth;
        public float neckHeight;
    }

    /// <summary>
    /// Contains the valid range of antialiasing levels usable with Unity render textures.
    /// </summary>
    public enum RenderTextureAntiAliasing
    {
        _1 = 1,
        _2 = 2,
        _4 = 4,
        _8 = 8,
    }

    /// <summary>
    /// Contains the valid range of texture depth values usable with Unity render textures.
    /// </summary>
    public enum RenderTextureDepth
    {
        _0 = 0,
        _16 = 16,
        _24 = 24,
    }

    /// <summary>
    /// Gets the singleton instance.
    /// </summary>
    public static SOVRManager instance { get; private set; }

    /// <summary>
    /// Gets a reference to the active SOVRDisplay
    /// </summary>
    public static SOVRDisplay display { get; private set; }

    /// <summary>
    /// Gets a reference to the active SOVRTracker
    /// </summary>
    public static SOVRTracker tracker { get; private set; }

    private static bool _profileIsCached = false;
    private static Profile _profile;
    /// <summary>
    /// Gets the current profile, which contains information about the user's settings and body dimensions.
    /// </summary>
    public static Profile profile
    {
        get
        {
            if (!_profileIsCached)
            {
#if UNITY_ANDROID && !UNITY_EDITOR
				float ipd = 0.0f;
				SOVR_GetInterpupillaryDistance(ref ipd);
				
				float eyeHeight = 0.0f;
				SOVR_GetPlayerEyeHeight(ref eyeHeight);
				
				_profile = new Profile
				{
					ipd = ipd,
					eyeHeight = eyeHeight,
					eyeDepth = 0.0805f, //TODO: Load from profile
					neckHeight = eyeHeight - 0.075f, // TODO: Load from profile
				};
#endif
                _profileIsCached = true;
            }

            return _profile;
        }
    }

    /// <summary>
    /// Occurs when an HMD attached.
    /// </summary>
    public static event Action HMDAcquired;

    /// <summary>
    /// Occurs when an HMD detached.
    /// </summary>
    public static event Action HMDLost;

    /// <summary>
    /// Occurs when the tracker gained tracking.
    /// </summary>
    public static event Action TrackingAcquired;

    /// <summary>
    /// Occurs when the tracker lost tracking.
    /// </summary>
    public static event Action TrackingLost;

    /// <summary>
    /// Occurs when HSW dismissed.
    /// </summary>
    public static event Action HSWDismissed;

    /// <summary>
    /// Occurs when the Native Texture Scale is modified.
    /// </summary>
    internal static event Action<float, float> NativeTextureScaleModified;

    /// <summary>
    /// Occurs when the Virtual Texture Scale is modified.
    /// </summary>
    internal static event Action<float, float> VirtualTextureScaleModified;

    /// <summary>
    /// Occurs when the Eye Texture AntiAliasing level is modified.
    /// </summary>
    internal static event Action<RenderTextureAntiAliasing, RenderTextureAntiAliasing> EyeTextureAntiAliasingModified;

    /// <summary>
    /// Occurs when the Eye Texture Depth is modified.
    /// </summary>
    internal static event Action<RenderTextureDepth, RenderTextureDepth> EyeTextureDepthModified;

    /// <summary>
    /// Occurs when the Eye Texture Format is modified.
    /// </summary>
    internal static event Action<RenderTextureFormat, RenderTextureFormat> EyeTextureFormatModified;

    /// <summary>
    /// Occurs when Monoscopic mode is modified.
    /// </summary>
    internal static event Action<bool, bool> MonoscopicModified;

    /// <summary>
    /// Occurs when HDR mode is modified.
    /// </summary>
    internal static event Action<bool, bool> HdrModified;


    /// <summary>
    /// If true, then the DX health and safety warning (HSW) is currently visible.
    /// </summary>
    public static bool isHSWDisplayed
    {
        get
        {
            return false;
        }
    }

    /// <summary>
    /// If the HSW has been visible for the necessary amount of time, this will make it disappear.
    /// </summary>
    public static void DismissHSWDisplay()
    {

    }

    /// <summary>
    /// Gets the current battery level.
    /// </summary>
    /// <returns><c>battery level in the range [0.0,1.0]</c>
    /// <param name="batteryLevel">Battery level.</param>
    public static float batteryLevel
    {
        get
        {
#if !UNITY_ANDROID || UNITY_EDITOR
            return 1.0f;
#else
			return SOVR_GetBatteryLevel();
#endif
        }
    }

    /// <summary>
    /// Gets the current battery temperature.
    /// </summary>
    /// <returns><c>battery temperature in Celsius</c>
    /// <param name="batteryTemperature">Battery temperature.</param>
    public static float batteryTemperature
    {
        get
        {
#if !UNITY_ANDROID || UNITY_EDITOR
            return 0.0f;
#else
			return SOVR_GetBatteryTemperature();
#endif
        }
    }

    /// <summary>
    /// Gets the current battery status.
    /// </summary>
    /// <returns><c>battery status</c>
    /// <param name="batteryStatus">Battery status.</param>
    public static int batteryStatus
    {
        get
        {
#if !UNITY_ANDROID || UNITY_EDITOR
            return 0;
#else
			return SOVR_GetBatteryStatus();
#endif
        }
    }

    /// <summary>
    /// Gets the current volume level.
    /// </summary>
    /// <returns><c>volume level in the range [0,MaxVolume], or -1 for not initialized.</c>
    public static int volumeLevel
    {
        get
        {
#if !UNITY_ANDROID || UNITY_EDITOR
            Debug.LogError("GetVolume() is only supported on Android");
            return -1;
#else
			return SOVR_GetVolume();
#endif
        }
    }

    /// <summary>
    /// Gets the time since last volume change
    /// </summary>
    /// <returns><c>time since last volume change or -1 for not initialized.</c>
    public static double timeSinceLastVolumeChange
    {
        get
        {
#if !UNITY_ANDROID || UNITY_EDITOR
            Debug.LogError("GetTimeSinceLastVolumeChange() is only supported on Android");
            return -1;
#else
			return SOVR_GetTimeSinceLastVolumeChange();
#endif
        }
    }

    [Range(0.1f, 4.0f)]
    /// <summary>
    /// Controls the size of the eye textures.
    /// Values must be above 0.
    /// Values below 1 permit sub-sampling for improved performance.
    /// Values above 1 permit super-sampling for improved sharpness.
    /// </summary>
    public float nativeTextureScale = 1.0f;

    [Range(0.1f, 1.0f)]
    /// <summary>
    /// Controls the size of the rendering viewport.
    /// Values must be above 0 and less than or equal to 1.
    /// Values below 1 permit dynamic sub-sampling for improved performance.
    /// </summary>
    public float virtualTextureScale = 1.0f;

    /// <summary>
    /// The format of each eye texture.
    /// </summary>
    public RenderTextureFormat eyeTextureFormat = RenderTextureFormat.Default;

    /// <summary>
    /// The antialiasing level of each eye texture.
    /// </summary>
    public RenderTextureAntiAliasing eyeTextureAntiAliasing = RenderTextureAntiAliasing._2;

    /// <summary>
    /// The depth of each eye texture in bits. Valid Unity render texture depths are 0, 16, and 24.
    /// </summary>
    public RenderTextureDepth eyeTextureDepth = RenderTextureDepth._24;

    /// <summary>
    /// If true, head tracking will affect the orientation of each SOVRCameraRig's cameras.
    /// </summary>
    public bool usePositionTracking = true;

    /// <summary>
    /// If true, TimeWarp will be used to correct the output of each SOVRCameraRig for rotational latency.
    /// </summary>
    public bool timeWarp = true;

    /// <summary>
    /// If this is true and TimeWarp is true, each SOVRCameraRig will stop tracking and only TimeWarp will respond to head motion.
    /// </summary>
    public bool freezeTimeWarp = false;

    /// <summary>
    /// If true, each scene load will cause the head pose to reset.
    /// </summary>
    public bool resetTrackerOnLoad = true;

    /// <summary>
    /// If true, the eyes see the same image, which is rendered only by the left camera.
    /// </summary>
    public bool monoscopic = false;

    /// <summary>
    /// If true, enable high dynamic range support.
    /// </summary>
    public bool hdr = false;

    /// <summary>
    /// True if the current platform supports virtual reality.
    /// </summary>
    public bool isSupportedPlatform { get; private set; }

    private static bool usingPositionTrackingCached = false;
    private static bool usingPositionTracking = false;
    private static bool wasHmdPresent = false;
    private static bool wasPositionTracked = false;
    private static float prevNativeTextureScale;
    private static float prevVirtualTextureScale;
    private static RenderTextureAntiAliasing prevEyeTextureAntiAliasing;
    private static RenderTextureDepth prevEyeTextureDepth;
    private static bool prevMonoscopic;
    private static bool prevHdr;
    private static RenderTextureFormat prevEyeTextureFormat;
    private static WaitForEndOfFrame waitForEndOfFrame = new WaitForEndOfFrame();

#if UNITY_ANDROID && !UNITY_EDITOR
	// Get this from Unity on startup so we can call Activity java functions.
	private static bool androidJavaInit = false;
	private static AndroidJavaObject activity;
	private static AndroidJavaClass javaVrActivityClass;

	internal static int timeWarpViewNumber = 0;

	[NonSerialized]
	private static SOVRVolumeControl volumeController = null;
	[NonSerialized]
	private Transform volumeControllerTransform = null;

	/// <summary>
	/// Occurs when the application is resumed.
	/// </summary>
	public static event Action OnApplicationResumed = null;

	/// <summary>
	/// Occurs before plugin initialized. Used to configure
	/// VR Mode Parms such as clock locks.
	/// </summary>
	public static event Action OnConfigureVrModeParms = null;

	public static void EnterVRMode()
	{
		SOVRPluginEvent.Issue(RenderEventType.Resume);        
	}

	public static void LeaveVRMode()
	{
		SOVRPluginEvent.Issue(RenderEventType.Pause);   
    }

	public delegate void VrApiEventDelegate( string eventData );

	public static VrApiEventDelegate OnVrApiEvent = null;

	private static Int32 MaxDataSize = 4096;
	private static StringBuilder EventData = new StringBuilder( MaxDataSize );

	// Define and set an event delegate if to handle System Activities events (for instance,
	// an app might handle the "reorient" event if it needs to reposition menus when the 
	// user selects Reorient in Activities. The eventData will be a JSON string.
	public static void SetVrApiEventDelegate( VrApiEventDelegate d )
	{
		OnVrApiEvent = d;
	}

	// This is just an example of an event delegate.
	public static void VrApiEventDefaultDelegate( string eventData )
	{
		Debug.Log( "VrApiEventDefaultDelegate: " + eventData );
	}
#else
    private static bool isQuitting;
#endif

    #region Unity Messages

    private void Awake()
    {
        // Only allow one instance at runtime.
        if (instance != null)
        {
            enabled = false;
            DestroyImmediate(this);
            return;
        }

        instance = this;

        // Detect whether this platform is a supported platform
        RuntimePlatform currPlatform = Application.platform;
        isSupportedPlatform |= currPlatform == RuntimePlatform.Android;
        isSupportedPlatform |= currPlatform == RuntimePlatform.LinuxPlayer;
        isSupportedPlatform |= currPlatform == RuntimePlatform.OSXEditor;
        isSupportedPlatform |= currPlatform == RuntimePlatform.OSXPlayer;
        isSupportedPlatform |= currPlatform == RuntimePlatform.WindowsEditor;
        isSupportedPlatform |= currPlatform == RuntimePlatform.WindowsPlayer;
        if (!isSupportedPlatform)
        {
            Debug.LogWarning("This platform is unsupported");
            return;
        }

#if UNITY_ANDROID && !UNITY_EDITOR

        Input.gyro.enabled = false;

		// log the unity version
		Debug.Log( "Unity Version: " + Application.unityVersion );

		// don't allow the application to run if orientation is not landscape left.
		if (Screen.orientation != ScreenOrientation.LandscapeLeft)
		{
			Debug.LogError("********************************************************************************\n");
			Debug.LogError("***** Default screen orientation must be set to landscape left for VR.\n" +
			               "***** Stopping application.\n");
			Debug.LogError("********************************************************************************\n");

			Debug.Break();
			Application.Quit();
		}

		// don't enable gyro, it is not used and triggers expensive display calls
		if (Input.gyro.enabled)
		{
            Input.gyro.updateInterval = 0.001f;
			Debug.LogError("*** Auto-Enabling Gyroscope ***");
			Input.gyro.enabled = false;
		}
		
		// NOTE: On Adreno Lollipop, it is an error to have antiAliasing set on the
		// main window surface with front buffer rendering enabled. The view will
		// render black.
		// On Adreno KitKat, some tiling control modes will cause the view to render
		// black.
		if (QualitySettings.antiAliasing > 1)
		{
			Debug.LogError("Antialiasing must be disabled for application");
		}

		// we sync in the TimeWarp, so we don't want unity
		// syncing elsewhere
		QualitySettings.vSyncCount = 0;

		// try to render at 60fps
		Application.targetFrameRate = 60;
		// don't allow the app to run in the background
		Application.runInBackground = false;
		// Disable screen dimming
		Screen.sleepTimeout = SleepTimeout.NeverSleep;

		if (!androidJavaInit)
		{
			AndroidJavaClass unityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
			activity = unityPlayer.GetStatic<AndroidJavaObject>("currentActivity");
			javaVrActivityClass = new AndroidJavaClass("com.dxvr.vrlib.VrActivity");
			// Prepare for the RenderThreadInit()
			SetInitVariables(activity.GetRawObject(), javaVrActivityClass.GetRawClass());

			androidJavaInit = true;
		}

		// We want to set up our touchpad messaging system
		//SOVRTouchpad.Create();

		InitVolumeController();

		// set an event delegate like this if you wish to handle events like "reorient".
		//SetVrApiEventDelegate( VrApiEventDefaultDelegate );
#else
        SetEditorPlay(Application.isEditor);
#endif

        prevEyeTextureAntiAliasing = SOVRManager.instance.eyeTextureAntiAliasing;
        prevEyeTextureDepth = SOVRManager.instance.eyeTextureDepth;
        prevEyeTextureFormat = SOVRManager.instance.eyeTextureFormat;
        prevNativeTextureScale = SOVRManager.instance.nativeTextureScale;
        prevVirtualTextureScale = SOVRManager.instance.virtualTextureScale;
        prevMonoscopic = SOVRManager.instance.monoscopic;
        prevHdr = SOVRManager.instance.hdr;

        if (display == null)
            display = new SOVRDisplay();
        if (tracker == null)
            tracker = new SOVRTracker();

        if (resetTrackerOnLoad)
            display.RecenterPose();
    }

    private void OnDestroy()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		RenderTexture.active = null;
#endif
    }

    private void OnApplicationQuit()
    {
#if !UNITY_ANDROID || UNITY_EDITOR
        isQuitting = true;
#else
		Debug.Log( "OnApplicationQuit" );
		
		// This will trigger the shutdown on the render thread
		SOVRPluginEvent.Issue( RenderEventType.ShutdownRenderThread );
#endif
    }

    private void OnEnable()
    {
        StartCoroutine(CallbackCoroutine());
    }

    private void OnDisable()
    {
        // NOTE: The coroutines will also be stopped when the object is destroyed.
        StopAllCoroutines();
    }

    private void Start()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		// Configure app-specific vr mode parms such as clock frequencies
		if ( OnConfigureVrModeParms != null )
		{
			OnConfigureVrModeParms();
		}

		// NOTE: For Android, the resolution should be the same for both left and right eye
		SOVRDisplay.EyeRenderDesc leftEyeDesc = SOVRManager.display.GetEyeRenderDesc(SOVREye.Left);
		Vector2 resolution = leftEyeDesc.resolution;
		SOVR_SetEyeParms((int)resolution.x,(int)resolution.y);

		// This will trigger the init on the render thread
		InitRenderThread();
#endif
    }

    public enum VrApiEventStatus
    {
        ERROR_INTERNAL = -2,        // queue isn't created, etc.
        ERROR_INVALID_BUFFER = -1,  // the buffer passed in was invalid
        NOT_PENDING = 0,            // no event is waiting
        PENDING,                    // an event is waiting
        CONSUMED,                   // an event was pending but was consumed internally
        BUFFER_OVERFLOW,            // an event is being returned, but it could not fit into the buffer
        INVALID_JSON                // there was an error parsing the JSON data
    }

    private void Update()
    {
        if (!usingPositionTrackingCached || usingPositionTracking != usePositionTracking)
        {
            tracker.isEnabled = usePositionTracking;
            usingPositionTracking = usePositionTracking;
            usingPositionTrackingCached = true;
        }

        // Dispatch any events.
        if (HMDLost != null && wasHmdPresent && !display.isPresent)
            HMDLost();

        if (HMDAcquired != null && !wasHmdPresent && display.isPresent)
            HMDAcquired();

        wasHmdPresent = display.isPresent;

        if (TrackingLost != null && wasPositionTracked && !tracker.isPositionTracked)
            TrackingLost();

        if (TrackingAcquired != null && !wasPositionTracked && tracker.isPositionTracked)
            TrackingAcquired();

        wasPositionTracked = tracker.isPositionTracked;

        if (NativeTextureScaleModified != null && nativeTextureScale != prevNativeTextureScale)
            NativeTextureScaleModified(prevNativeTextureScale, nativeTextureScale);

        prevNativeTextureScale = nativeTextureScale;

        if (VirtualTextureScaleModified != null && virtualTextureScale != prevVirtualTextureScale)
            VirtualTextureScaleModified(prevVirtualTextureScale, virtualTextureScale);

        prevVirtualTextureScale = virtualTextureScale;

        if (EyeTextureAntiAliasingModified != null && eyeTextureAntiAliasing != prevEyeTextureAntiAliasing)
            EyeTextureAntiAliasingModified(prevEyeTextureAntiAliasing, eyeTextureAntiAliasing);

        prevEyeTextureAntiAliasing = eyeTextureAntiAliasing;

        if (EyeTextureDepthModified != null && eyeTextureDepth != prevEyeTextureDepth)
            EyeTextureDepthModified(prevEyeTextureDepth, eyeTextureDepth);

        prevEyeTextureDepth = eyeTextureDepth;

        if (EyeTextureFormatModified != null && eyeTextureFormat != prevEyeTextureFormat)
            EyeTextureFormatModified(prevEyeTextureFormat, eyeTextureFormat);

        prevEyeTextureFormat = eyeTextureFormat;

        if (MonoscopicModified != null && monoscopic != prevMonoscopic)
            MonoscopicModified(prevMonoscopic, monoscopic);

        prevMonoscopic = monoscopic;

        if (HdrModified != null && hdr != prevHdr)
            HdrModified(prevHdr, hdr);

        prevHdr = hdr;

        if (isHSWDisplayed && Input.anyKeyDown)
        {
            DismissHSWDisplay();

            if (HSWDismissed != null)
                HSWDismissed();
        }

        display.Update();

#if UNITY_ANDROID && !UNITY_EDITOR
		if (volumeController != null)
		{
			if (volumeControllerTransform == null)
			{
				if (gameObject.GetComponent<SOVRCameraRig>() != null)
				{
					volumeControllerTransform = gameObject.GetComponent<SOVRCameraRig>().centerEyeAnchor;
				}
			}
			volumeController.UpdatePosition(volumeControllerTransform);
		}

		// Service VrApi events
		// If this code is not called, internal VrApi events will never be pushed to the internal event queue.
		VrApiEventStatus pendingResult = (VrApiEventStatus)SOVR_GetNextPendingEvent( EventData, (uint)MaxDataSize );
		while( pendingResult == VrApiEventStatus.PENDING ) {
			if ( OnVrApiEvent != null )
			{
				OnVrApiEvent( EventData.ToString() );
			}
			else
			{
				Debug.Log( "No OnVrApiEvent delegate set!" );
			}

			EventData.Length = 0;
			pendingResult = (VrApiEventStatus)SOVR_GetNextPendingEvent( EventData, (uint)MaxDataSize );
		}
#endif
    }

    private IEnumerator CallbackCoroutine()
    {
        while (true)
        {
            yield return waitForEndOfFrame;

#if UNITY_ANDROID && !UNITY_EDITOR
			SOVRManager.DoTimeWarp(timeWarpViewNumber);
#endif
        }
    }

#if UNITY_ANDROID && !UNITY_EDITOR
	private void OnPause()
	{
		LeaveVRMode();
	}

	private IEnumerator OnResume()
	{
		yield return new WaitForSeconds(1f);

		if (OnApplicationResumed != null)
		{
			OnApplicationResumed();
		}

		EnterVRMode();    

        SOVRManager.display.RecenterPoseYaw();
	}

	private void OnApplicationPause(bool pause)
	{
		Debug.Log("OnApplicationPause() " + pause);
		if (pause)
		{
			OnPause();
		}
		else
		{
			StartCoroutine(OnResume());
		}
	}

	void OnApplicationFocus( bool focus )
	{
		// OnApplicationFocus() does not appear to be called 
		// consistently while OnApplicationPause is. Moved
		// functionality to OnApplicationPause().
		
		Debug.Log( "OnApplicationFocus() " + focus );
	}

	/// <summary>
	/// Creates a popup dialog that shows when volume changes.
	/// </summary>
	private static void InitVolumeController()
	{
		if (volumeController == null)
		{
			Debug.Log("Creating volume controller...");
			// Create the volume control popup
			GameObject go = GameObject.Instantiate(Resources.Load("SOVRVolumeController")) as GameObject;
			if (go != null)
			{
				volumeController = go.GetComponent<SOVRVolumeControl>();
			}
			else
			{
				Debug.LogError("Unable to instantiate volume controller");
			}
		}
	}
    
	/// <summary>
	/// Leaves the application/game and returns to the launcher/dashboard
	/// </summary>
	public void ReturnToLauncher()
	{
		// show the platform UI quit prompt
		SOVRManager.PlatformUIConfirmQuit();
	}
#endif
    #endregion

    public static void SetEditorPlay(bool isEditor)
    {

    }

    public static void SetInitVariables(IntPtr activity, IntPtr vrActivityClass)
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		SOVR_SetInitVariables(activity, vrActivityClass);
#endif
    }

    public static void PlatformUIConfirmQuit()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		SOVRPluginEvent.Issue(RenderEventType.PlatformUIConfirmQuit);
#endif
    }

    public static void PlatformUIGlobalMenu()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		SOVRPluginEvent.Issue(RenderEventType.PlatformUI);
#endif
    }

    public static void DoTimeWarp(int timeWarpViewNumber)
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		SOVRPluginEvent.IssueWithData(RenderEventType.TimeWarp, timeWarpViewNumber);
#endif
    }

    public static void EndEye(SOVREye eye)
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		RenderEventType eventType = (eye == SOVREye.Left) ?
			RenderEventType.LeftEyeEndFrame :
			RenderEventType.RightEyeEndFrame;
		int eyeTextureId = display.GetEyeTextureId(eye);

		SOVRPluginEvent.IssueWithData(eventType, eyeTextureId);
#endif
    }

    public static void InitRenderThread()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		SOVRPluginEvent.Issue(RenderEventType.InitRenderThread);
#endif
    }

    private const string LibSOVR = "Integration";

#if UNITY_ANDROID && !UNITY_EDITOR
	[DllImport(LibSOVR)]
	private static extern void SOVR_SetInitVariables(IntPtr activity, IntPtr vrActivityClass);
	[DllImport(LibSOVR)]
	private static extern void SOVR_SetEyeParms( int fbWidth, int fbHeight );
	[DllImport(LibSOVR)]
	private static extern float SOVR_GetBatteryLevel();
	[DllImport(LibSOVR)]
	private static extern int SOVR_GetBatteryStatus();
	[DllImport(LibSOVR)]
	private static extern float SOVR_GetBatteryTemperature();
	[DllImport(LibSOVR)]
	private static extern int SOVR_GetVolume();
	[DllImport(LibSOVR)]
	private static extern double SOVR_GetTimeSinceLastVolumeChange();

	[DllImport(LibSOVR)]
	private static extern bool SOVR_GetPlayerEyeHeight(ref float eyeHeight);
	[DllImport(LibSOVR)]
	private static extern bool SOVR_GetInterpupillaryDistance(ref float interpupillaryDistance);
	[DllImport(LibSOVR)]
	private static extern int SOVR_GetNextPendingEvent( StringBuilder sb, uint bufferSize );
#endif
}
