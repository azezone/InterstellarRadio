﻿using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;
using SOVR.Android;

/// <summary>
/// Add SOVROverlay script to an object with a Quad mesh filter to have the quad
/// rendered as a TimeWarp overlay instead by drawing it into the eye buffer.
/// This will take full advantage of the display resolution and avoid double
/// resampling of the texture.
/// 
/// If the texture is dynamically generated, as for an interactive GUI or
/// animation, it must be explicitly triple buffered to avoid flickering
/// when it is referenced asynchronously by TimeWarp.
/// </summary>
public class SOVROverlay : MonoBehaviour
{
    public enum OverlayType
    {
        None,           // Disabled the overlay
        Underlay,       // Eye buffers blend on top
        Overlay,        // Blends on top of the eye buffer
        OverlayShowLod  // Blends on top and colorizes texture level of detail
    };

#pragma warning disable 414       // The private field 'x' is assigned but its value is never used
    Matrix4x4 toSOVRMatrix = Matrix4x4.Scale(new Vector3(0.5f, -0.5f, -0.5f));
    OverlayType currentOverlayType = OverlayType.Overlay;
    int texId = 0;
#pragma warning restore 414       // The private field 'x' is assigned but its value is never used

#if UNITY_ANDROID && !UNITY_EDITOR
	[DllImport("Integration")]
	private static extern void SOVR_TW_SetOverlayPlane (int texId, int eye, int program,
	                                          float m0, float m1, float m2, float m3,
	                                          float m4, float m5, float m6, float m7,
	                                          float m8, float m9, float m10, float m11,
	                                          float m12, float m13, float m14, float m15);
#endif

    void Awake()
    {
        Debug.Log("Overlay Awake");

        // Getting the NativeTextureID/PTR synchronizes with the multithreaded renderer, which
        // causes a problem on the first frame if this gets called after the SOVRDisplay initialization,
        // so do it in Awake() instead of Start().
        texId = (int)this.GetComponent<Renderer>().material.mainTexture.GetNativeTexturePtr();
    }

    void Update()
    {
        if (Input.GetKey(KeyCode.Joystick1Button0))
        {
            currentOverlayType = OverlayType.None;
        }
        else if (Input.GetKey(KeyCode.Joystick1Button1))
        {
            currentOverlayType = OverlayType.OverlayShowLod;
        }
        else
        {
            currentOverlayType = OverlayType.Overlay;
        }
    }

    void OnRenderObject()
    {
        // The overlay must be specified every eye frame, because it is positioned relative to the
        // current head location.  If frames are dropped, it will be time warped appropriately,
        // just like the eye buffers.

        if (currentOverlayType == OverlayType.None)
        {
            GetComponent<Renderer>().enabled = true;    // use normal renderer
            return;
        }

        GetComponent<Renderer>().enabled = false;       // render with the overlay plane instead of the normal renderer

#if UNITY_ANDROID && !UNITY_EDITOR
		int eyeNum = (Camera.current.depth == (int)RenderEventType.RightEyeEndFrame) ? 1 : 0;
		Matrix4x4 mv = Camera.current.worldToCameraMatrix * this.transform.localToWorldMatrix * toSOVRMatrix;

		SOVR_TW_SetOverlayPlane (texId, eyeNum, (int)currentOverlayType,
	                        mv [0, 0], mv [0, 1], mv [0, 2], mv [0, 3],
	                        mv [1, 0], mv [1, 1], mv [1, 2], mv [1, 3],
	                        mv [2, 0], mv [2, 1], mv [2, 2], mv [2, 3],
	       					mv [3, 0], mv [3, 1], mv [3, 2], mv [3, 3]);
#endif
    }

}
