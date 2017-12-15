using InterstellarRadio.Model;
using System;
using System.Collections;
using UnityEngine;

public class ResultShower : MonoBehaviour
{
    [SerializeField]
    private VideoPage _VideoPlayer;

    public VideoPage videoPlayer
    {
        get
        {
            return _VideoPlayer;
        }
    }

    public static ResultShower instance = null;
    private ResultDataConfig _resultConfig = new ResultDataConfig();

    private void Awake()
    {
        if (instance != null && instance != this)
        {
            DestroyImmediate(instance);
        }

        instance = this;

        StartCoroutine(Load());
    }

    public void Show(ResultType type)
    {
        switch (type)
        {
            case ResultType.none:
                break;
            case ResultType.video:
                Ftimer.AddEvent("playeravideo", 0.2f, () =>
                {
                    _VideoPlayer.PlayAVideo(_resultConfig.GetAVideoItem());
                });
                break;
            case ResultType.voice:
                break;
            case ResultType.game:
                break;
            case ResultType.picture:
                break;
            case ResultType.lable:
                break;
            default:
                break;
        }
    }

    private IEnumerator Load()
    {
        string path = DXUtil.GetStreamingAssetPath() + "/Configs/ResultConfig.xml";
        //if (!System.IO.File.Exists(path))
        //{
        //    Debug.LogError("file is not exist!");
        //}
        WWW www = new WWW(path);
        yield return www;
        if (www.isDone && string.IsNullOrEmpty(www.error))
        {
            _resultConfig.Init(www.text);
        }
        else
        {
            Debug.LogError("path:" + path);
            Debug.LogError(www.error);
        }
    }
}