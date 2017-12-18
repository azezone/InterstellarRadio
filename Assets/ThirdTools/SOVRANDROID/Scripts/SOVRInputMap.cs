using UnityEngine;
using System.Collections;

public class SOVRInputMap : MonoBehaviour
{
    [SerializeField]
    public bool useController = false;

    // Supported gamepad type:
    // 1. Joystick, like Baofeng; 2. HID standard gamepad
    public static SOVRJoystickKeyCode keyCodes;
    public static SOVRHIDKeyCode keyCodeMogaHID;

    public struct SOVRJoystickKeyCode
    {
        public bool KEYCODE_BUTTON_A;
        public bool KEYCODE_BUTTON_B;
        public bool KEYCODE_BUTTON_R1;
        public bool KEYCODE_BACK;
        public float axisX;
        public float axisY;
    }

    public struct SOVRHIDKeyCode
    {
        public bool KEYCODE_BUTTON_A;
        public bool KEYCODE_BUTTON_B;
        public bool KEYCODE_BUTTON_X;
        public bool KEYCODE_BUTTON_Y;
        public bool KEYCODE_BUTTON_R1;
        public bool KEYCODE_BUTTON_R2;
        public bool KEYCODE_BUTTON_L1;
        public bool KEYCODE_BUTTON_L2;
        public bool KEYCODE_BUTTON_START;
        public bool KEYCODE_BUTTON_SELECT;
        public float axisX;
        public float axisY;
        public float rightAxisX;
        public float rightAxisY;
        public float dpadX;
        public float dpadY;
    }

    void Update()
    {
        if (useController)
        {
            keyCodes.axisX = Input.GetAxis("Joystick_hor");
            keyCodes.axisY = Input.GetAxis("Joystick_ver");

            keyCodeMogaHID.axisX = Input.GetAxis("Horizontal");
            keyCodeMogaHID.axisY = Input.GetAxis("Vertical");
            keyCodeMogaHID.rightAxisX = Input.GetAxis("Right Horizontal");
            keyCodeMogaHID.rightAxisY = Input.GetAxis("Right Vertical");

            keyCodeMogaHID.dpadX = Input.GetAxis("Dpad X");
            keyCodeMogaHID.dpadY = Input.GetAxis("Dpad Y");

            if (Input.GetKeyDown(KeyCode.JoystickButton0))
            {
                keyCodes.KEYCODE_BUTTON_A = true;
                keyCodeMogaHID.KEYCODE_BUTTON_A = true;
            }
            else if (Input.GetKeyDown(KeyCode.JoystickButton1))
            {
                keyCodes.KEYCODE_BUTTON_B = true;
                keyCodeMogaHID.KEYCODE_BUTTON_B = true;
            }
            else if (Input.GetKeyDown(KeyCode.Escape) || Input.GetKeyDown(KeyCode.Pause))
            {
                keyCodes.KEYCODE_BACK = true;
                keyCodeMogaHID.KEYCODE_BUTTON_SELECT = true;
            }
            else if (Input.GetKeyDown(KeyCode.JoystickButton4))
            {
                keyCodeMogaHID.KEYCODE_BUTTON_L1 = true;
            }
            else if (Input.GetKeyDown(KeyCode.JoystickButton5))
            {
                keyCodes.KEYCODE_BUTTON_R1 = true;
                keyCodeMogaHID.KEYCODE_BUTTON_R1 = true;
            }
            else if (Input.GetKeyDown(KeyCode.JoystickButton2))
            {
                keyCodeMogaHID.KEYCODE_BUTTON_X = true;
            }
            else if (Input.GetKeyDown(KeyCode.JoystickButton3))
            {
                keyCodeMogaHID.KEYCODE_BUTTON_Y = true;
            }
            else if (Input.GetKeyDown(KeyCode.JoystickButton10))
            {
                keyCodeMogaHID.KEYCODE_BUTTON_START = true;
            }
            else if (Input.GetKeyDown(KeyCode.LeftAlt))
            {
                keyCodeMogaHID.KEYCODE_BUTTON_L2 = true;
            }
            else if (Input.GetKeyDown(KeyCode.RightAlt))
            {
                keyCodeMogaHID.KEYCODE_BUTTON_R2 = true;
            }
            else
            {
                keyCodes.KEYCODE_BUTTON_A = false;
                keyCodes.KEYCODE_BUTTON_B = false;
                keyCodes.KEYCODE_BACK = false;
                keyCodes.KEYCODE_BUTTON_R1 = false;

                keyCodeMogaHID.KEYCODE_BUTTON_A = false;
                keyCodeMogaHID.KEYCODE_BUTTON_B = false;
                keyCodeMogaHID.KEYCODE_BUTTON_X = false;
                keyCodeMogaHID.KEYCODE_BUTTON_Y = false;
                keyCodeMogaHID.KEYCODE_BUTTON_R1 = false;
                keyCodeMogaHID.KEYCODE_BUTTON_R2 = false;
                keyCodeMogaHID.KEYCODE_BUTTON_L1 = false;
                keyCodeMogaHID.KEYCODE_BUTTON_L2 = false;
                keyCodeMogaHID.KEYCODE_BUTTON_START = false;
                keyCodeMogaHID.KEYCODE_BUTTON_SELECT = false;
            }

            Event e = Event.current;
            if (e.isKey)
            {
                Debug.Log("[SOVRInputMap]: key:" + e.keyCode);
            }
            else if (e.isMouse)
            {
                Debug.Log("[SOVRInputMap]: mouse event.");
            }
        }
    }
}
