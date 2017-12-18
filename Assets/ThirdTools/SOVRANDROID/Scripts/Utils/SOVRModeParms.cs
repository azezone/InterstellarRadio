using UnityEngine;
using System.Runtime.InteropServices; // required for DllImport

public class SOVRModeParms : MonoBehaviour
{
#if (UNITY_ANDROID && !UNITY_EDITOR)
	[DllImport("Integration")]
	// Set the fixed CPU clock level.
	private static extern void SOVR_VrModeParms_SetCpuLevel(int cpuLevel);

	[DllImport("Integration")]
	// Set the fixed GPU clock level.
	private static extern void SOVR_VrModeParms_SetGpuLevel(int gpuLevel);

	[DllImport("Integration")]
	// If true, when the application detects it has been throttled, the Platform
	// UI will display a dismissable warning, then returns to the app in powersave
	// mode at 30FPS.
	// If false, the Platform UI will display a non-dismissable error message
	// indicating the user must leave VR.
	// Set to false if the application continues to judder even when forced to
	// 30FPS in power save mode.
	private static extern void SOVR_VrModeParms_SetAllowPowerSave(bool allow);

	[DllImport("Integration")]
	// Returns true if the application has been throttled.
	private static extern bool SOVR_IsPowerSaveActive();

	[DllImport("Integration")]
	// Support to fix 60/30/20 FPS frame rate for consistency or power savings.
	private static extern void SOVR_TW_SetMinimumVsyncs(SOVRTimeWarpUtils.VsyncMode mode);
#endif

    /// <summary>
    /// Enable vr mode parm configuration and invoke power state mode test.
    /// </summary>
    void OnEnable()
    {
#if (UNITY_ANDROID && !UNITY_EDITOR)
		SOVRManager.OnConfigureVrModeParms += ConfigureVrModeParms;
		
		// Call TestPowerLevelState after 10 seconds 
		// and repeats every 10 seconds.
		//InvokeRepeating ("TestPowerStateMode", 10, 10.0f);
#endif
    }

    /// <summary>
    /// Disable vr mode parm configuration and un-invoke power state mode test.
    /// </summary>
    void OnDisable()
    {
#if (UNITY_ANDROID && !UNITY_EDITOR)
		SOVRManager.OnConfigureVrModeParms -= ConfigureVrModeParms;

		//CancelInvoke();
#endif
    }

    /// <summary>
    /// Check current power state mode.
    /// </summary>
    void TestPowerStateMode()
    {
#if (UNITY_ANDROID && !UNITY_EDITOR)
		//*************************
		// Check power-level state mode
		//*************************
		if (SOVR_IsPowerSaveActive())
		{
			// The device has been throttled
			Debug.Log("POWER SAVE MODE ACTIVATED");
		}
#endif
    }

    /// <summary>
    /// Configure vr mode parms.
    /// </summary>
    void ConfigureVrModeParms()
    {
#if (UNITY_ANDROID && !UNITY_EDITOR)
		// De-clock to reduce power and thermal load.		
        
        if (IsAndroidDeviceInBlacklist())
        {
            Debug.Log("Current device model is" + SystemInfo.deviceModel);
            Application.targetFrameRate = 30;
            // Performance mode (default)
		    SOVR_VrModeParms_SetCpuLevel(0);
		    SOVR_VrModeParms_SetGpuLevel(0);
		    SOVR_TW_SetMinimumVsyncs(SOVRTimeWarpUtils.VsyncMode.VSYNC_30FPS);
		    SOVR_VrModeParms_SetAllowPowerSave(true);		
        }
        else
        {
            Application.targetFrameRate = 60;
		    SOVR_VrModeParms_SetCpuLevel(2);
		    SOVR_VrModeParms_SetGpuLevel(2);
		    SOVR_TW_SetMinimumVsyncs(SOVRTimeWarpUtils.VsyncMode.VSYNC_60FPS);

		    SOVR_VrModeParms_SetAllowPowerSave(true);
        }		        
#endif
    }

    // Build android phone blacklist
    public bool IsAndroidDeviceInBlacklist()
    {
        if (SystemInfo.deviceModel.Contains("Le X620")
            || SystemInfo.deviceModel.Contains("MT7-TL00"))
        {
            Debug.Log("(⊙o⊙)…Sorry, Your device can't hold high quality VR Mode!");
            return true;
        }            

        return false;
    }

    public static bool IsDeviceInBlacklist()
    {
        if (SystemInfo.deviceModel.Contains("Le X620")
            || SystemInfo.deviceModel.Contains("MT7-TL00"))
        {
            Debug.Log("(⊙o⊙)…Sorry, Your device can't hold high quality VR Mode!");
            return true;
        }

        return false;
    }
}
