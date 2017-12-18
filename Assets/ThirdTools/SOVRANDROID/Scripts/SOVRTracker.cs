using System;
using System.Runtime.InteropServices;
using UnityEngine;
using SOVR;

/// <summary>
/// An infrared camera that tracks the position of a head-mounted display.
/// </summary>
public class SOVRTracker
{
    /// <summary>
    /// The (symmetric) visible area in front of the tracker.
    /// </summary>
    public struct Frustum
    {
        /// <summary>
        /// The tracker cannot track the HMD unless it is at least this far away.
        /// </summary>
        public float nearZ;
        /// <summary>
        /// The tracker cannot track the HMD unless it is at least this close.
        /// </summary>
        public float farZ;
        /// <summary>
        /// The tracker's horizontal and vertical fields of view in degrees.
        /// </summary>
        public Vector2 fov;
    }

    /// <summary>
    /// If true, a tracker is attached to the system.
    /// </summary>
    public bool isPresent
    {
        get
        {
            return false;
        }
    }

    /// <summary>
    /// If true, the tracker can see and track the HMD. Otherwise the HMD may be occluded or the system may be malfunctioning.
    /// </summary>
    public bool isPositionTracked
    {
        get
        {
            return false;
        }
    }

    /// <summary>
    /// If this is true and a tracker is available, the system will use position tracking when isPositionTracked is also true.
    /// </summary>
    public bool isEnabled
    {
        get
        {
            return false;
        }

        set
        {

        }
    }

    /// <summary>
    /// Gets the tracker's viewing frustum.
    /// </summary>
    public Frustum frustum
    {
        get
        {
            return new Frustum
            {
                nearZ = 0.1f,
                farZ = 1000.0f,
                fov = new Vector2(90.0f, 90.0f)
            };
        }
    }

    /// <summary>
    /// Gets the tracker's pose, relative to the head's pose at the time of the last pose recentering.
    /// </summary>
    public SOVRPose GetPose(double predictionTime = 0d)
    {
        return new SOVRPose
        {
            position = Vector3.zero,
            orientation = Quaternion.identity
        };
    }
}
