using UnityEngine;

public class ResultDataConfig
{
    private ResultConfig _resultData = null;
    public ResultConfig resultData
    {
        get
        {
            return _resultData;
        }
    }

    public void Init(string data)
    {
        _resultData = (ResultConfig)XMLHelper.Deserialize(typeof(ResultConfig), data);
        if (resultData == null)
        {
            Debug.LogError("result data is null!");
        }
    }

    public VideoItem GetAVideoItem()
    {
        if (resultData != null && resultData.videos != null)
        {
            int random = UnityEngine.Random.Range(0, resultData.videos.Length);
            return resultData.videos[random];
        }
        else
        {
            return null;
        }
    }

    public ImageItem GetAImageItem()
    {
        int random = UnityEngine.Random.Range(0, resultData.images.Length - 1);
        return resultData.images[random];
    }

    public LableItem GetALableItem()
    {
        int random = UnityEngine.Random.Range(0, resultData.lables.Length - 1);
        return resultData.lables[random];
    }
}