using System;
using UnityEngine;
using System.Collections; // required for Coroutines
using SOVR.Android;

public class SOVRPostRender : MonoBehaviour
{
#if UNITY_ANDROID && !UNITY_EDITOR
	public static event Action OnCustomPostRender = null;
#endif

    void OnPostRender()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
		// Allow custom code to render before we kick off the plugin
		if (OnCustomPostRender != null)
		{
			OnCustomPostRender();
		}

		SOVREye eye = ((RenderEventType)Camera.current.depth == RenderEventType.RightEyeEndFrame) ?
			SOVREye.Right : SOVREye.Left;
		SOVRManager.EndEye(eye);
#endif
    }
}
