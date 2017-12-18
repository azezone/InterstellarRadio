using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace SOVR
{
    /// <summary>
    /// A 2D vector with integer components.
    /// </summary>
    [StructLayout(LayoutKind.Explicit)]
    public struct Vector2i
    {
        [FieldOffset(0)]
        public Int32 x;
        [FieldOffset(4)]
        public Int32 y;

        public Vector2i(Int32 _x, Int32 _y)
        {
            x = _x;
            y = _y;
        }
    };

    /// <summary>
    /// A 2D size with integer components.
    /// </summary>
    [StructLayout(LayoutKind.Explicit)]
    public struct Sizei
    {
        [FieldOffset(0)]
        public Int32 w;
        [FieldOffset(4)]
        public Int32 h;

        public Sizei(Int32 _w, Int32 _h)
        {
            w = _w;
            h = _h;
        }
    };

    /// <summary>
    /// A 2D rectangle with a position and size.
    /// All components are integers.
    /// </summary>
    [StructLayout(LayoutKind.Explicit)]
    public struct Recti
    {
        [FieldOffset(0)]
        public Vector2i Pos;
        [FieldOffset(8)]
        public Sizei Size;
    };

    /// <summary>
    /// A quaternion rotation.
    /// </summary>
    [StructLayout(LayoutKind.Explicit)]
    public struct Quatf
    {
        [FieldOffset(0)]
        public float x;
        [FieldOffset(4)]
        public float y;
        [FieldOffset(8)]
        public float z;
        [FieldOffset(12)]
        public float w;

        public Quatf(float _x, float _y, float _z, float _w)
        {
            x = _x;
            y = _y;
            z = _z;
            w = _w;
        }
    };

    /// <summary>
    /// A 2D vector with float components.
    /// </summary>
    [StructLayout(LayoutKind.Explicit)]
    public struct Vector2f
    {
        [FieldOffset(0)]
        public float x;
        [FieldOffset(4)]
        public float y;

        public Vector2f(float _x, float _y)
        {
            x = _x;
            y = _y;
        }
    };

    /// <summary>
    /// A 3D vector with float components.
    /// </summary>
    [StructLayout(LayoutKind.Explicit)]
    public struct Vector3f
    {
        [FieldOffset(0)]
        public float x;
        [FieldOffset(4)]
        public float y;
        [FieldOffset(8)]
        public float z;

        public Vector3f(float _x, float _y, float _z)
        {
            x = _x;
            y = _y;
            z = _z;
        }
    };

    /// <summary>
    /// A 4x4 matrix with float elements.
    /// </summary>
    [StructLayout(LayoutKind.Sequential)]
    public struct Matrix4f
    {
        public float[,] m;

        internal Matrix4f(Matrix4f_Raw raw)
        {
            this.m = new float[,] {
                { raw.m00, raw.m01, raw.m02, raw.m03 },
                { raw.m10, raw.m11, raw.m12, raw.m13 },
                { raw.m20, raw.m21, raw.m22, raw.m23 },
                { raw.m30, raw.m31, raw.m32, raw.m33 } };
        }
    };

    [StructLayout(LayoutKind.Explicit)]
    internal struct Matrix4f_Raw
    {
        [FieldOffset(0)]
        public float m00;
        [FieldOffset(4)]
        public float m01;
        [FieldOffset(8)]
        public float m02;
        [FieldOffset(12)]
        public float m03;

        [FieldOffset(16)]
        public float m10;
        [FieldOffset(20)]
        public float m11;
        [FieldOffset(24)]
        public float m12;
        [FieldOffset(28)]
        public float m13;

        [FieldOffset(32)]
        public float m20;
        [FieldOffset(36)]
        public float m21;
        [FieldOffset(40)]
        public float m22;
        [FieldOffset(44)]
        public float m23;

        [FieldOffset(48)]
        public float m30;
        [FieldOffset(52)]
        public float m31;
        [FieldOffset(56)]
        public float m32;
        [FieldOffset(60)]
        public float m33;
    };

    /// <summary>
    /// Position and orientation together.
    /// </summary>
    [StructLayout(LayoutKind.Explicit)]
    public struct Posef
    {
        [FieldOffset(0)]
        public Quatf Orientation;
        [FieldOffset(16)]
        public Vector3f Position;

        public Posef(Quatf q, Vector3f p)
        {
            Orientation = q;
            Position = p;
        }
    };

    /// <summary>
    /// Logging levels
    /// </summary>
    public enum LogLevel
    {
        Debug = 0,
        Info = 1,
        Error = 2,
    }

    /// <summary>
    /// Specifies which eye is being used for rendering.
    /// This type explicitly does not include a third "NoStereo" option, as such is
    /// not required for an HMD-centered API.
    /// </summary>
    public enum Eye
    {
        Left = 0,
        Right = 1,
        Count = 2,
    };



}
