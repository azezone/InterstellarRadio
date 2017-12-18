using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class SOVRShowParms : MonoBehaviour
{

    private GameObject m_buttonFPS;
    private GameObject m_buttonFOV;
    private GameObject m_buttonHeadPose;
    private GameObject m_buttonPredictTime;
    private GameObject m_buttonHeadPoseOrentationW;
    private GameObject m_buttonHeadPoseOrentationX;
    private GameObject m_buttonHeadPoseOrentationY;
    private GameObject m_buttonHeadPoseOrentationZ;
    private GameObject m_buttonResolution;

    private float UpdateInterval = 0.5f;
    private float Accum = 0.0f;
    private int Frames = 0;
    private float TimeLeft = 0.0f;

    public float predictTime = 0.0f;

    void Start()
    {
        m_buttonFPS = GameObject.Find("Button_fps");
        m_buttonFOV = GameObject.Find("Button_fov");
        m_buttonHeadPose = GameObject.Find("Button_headPose");
        m_buttonPredictTime = GameObject.Find("Button_predict");
        m_buttonResolution = GameObject.Find("Button_resolution");
        m_buttonHeadPoseOrentationW = GameObject.Find("Button_headOrentationW");
        m_buttonHeadPoseOrentationX = GameObject.Find("Button_headOrentationX");
        m_buttonHeadPoseOrentationY = GameObject.Find("Button_headOrentationY");
        m_buttonHeadPoseOrentationZ = GameObject.Find("Button_headOrentationZ");
    }

    void Update()
    {
        UpdateFPS();
        UpdateFOV();
        UpdatePredictTime();
        UpdateHeadPose();
        UpdateResolutionEyeTexture();
    }

    private void UpdateFPS()
    {
        TimeLeft -= Time.unscaledDeltaTime;
        Accum += Time.unscaledDeltaTime;
        ++Frames;

        if (TimeLeft <= 0.0)
        {
            float fps = Frames / Accum;
            m_buttonFPS.GetComponentInChildren<Text>().text = System.String.Format("FPS: {0:F2}", fps); ;
            TimeLeft += UpdateInterval;
            Accum = 0.0f;
            Frames = 0;
        }
    }

    void UpdateFOV()
    {
        SOVRDisplay.EyeRenderDesc eyeDesc = SOVRManager.display.GetEyeRenderDesc(SOVREye.Left);
        m_buttonFOV.GetComponentInChildren<Text>().text = System.String.Format("FOV (deg): {0:F3}", eyeDesc.fov.y);        
    }

    void UpdatePredictTime()
    {
        float time = (float)(SOVRManager.display.predictTime * (double)(1000));
        m_buttonPredictTime.GetComponentInChildren<Text>().text = System.String.Format("Predict(ms): {0:F3}", time);
    }

    void UpdateHeadPose()
    {
        SOVRPose hmdHeadPose = SOVRManager.display.GetHeadPose(0);
        m_buttonHeadPose.GetComponentInChildren<Text>().text = System.String.Format("HeadPose: {0}, {1}, {2}", hmdHeadPose.position.x, hmdHeadPose.position.y, hmdHeadPose.position.z);
        m_buttonHeadPoseOrentationW.GetComponentInChildren<Text>().text = System.String.Format("W: {0:F6}", hmdHeadPose.orientation.w);
        m_buttonHeadPoseOrentationX.GetComponentInChildren<Text>().text = System.String.Format("X: {0:F6}", hmdHeadPose.orientation.x);
        m_buttonHeadPoseOrentationY.GetComponentInChildren<Text>().text = System.String.Format("Y: {0:F6}", hmdHeadPose.orientation.y);
        m_buttonHeadPoseOrentationZ.GetComponentInChildren<Text>().text = System.String.Format("Z: {0:F6}", hmdHeadPose.orientation.z);

        //Debug.Log("ore" + hmdHeadPose.orientation.w + hmdHeadPose.orientation.x + hmdHeadPose.orientation.y + hmdHeadPose.orientation.z);
    }

    void UpdateResolutionEyeTexture()
    {
        SOVRDisplay.EyeRenderDesc leftEyeDesc = SOVRManager.display.GetEyeRenderDesc(SOVREye.Left);
        SOVRDisplay.EyeRenderDesc rightEyeDesc = SOVRManager.display.GetEyeRenderDesc(SOVREye.Right);

        float scale = SOVRManager.instance.virtualTextureScale;
        float w = (int)(scale * (float)(leftEyeDesc.resolution.x));
        float h = (int)(scale * (float)Mathf.Max(leftEyeDesc.resolution.y, rightEyeDesc.resolution.y));

        m_buttonResolution.GetComponentInChildren<Text>().text = System.String.Format("Res:{0}x{1}", w, h);
    }
}
