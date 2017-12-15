using System.IO;
using System.Security.Cryptography;
using System.Text;
using UnityEngine;
using UnityEngine.UI;

public class DXUtil
{
    public static string Millisecond2TimeString(long ms)
    {
        int second = (int)(ms / 1000 % 60);
        int minute = (int)(ms / 1000 / 60 % 60);
        int hour = (int)(ms / 1000 / 60 / 60);
        return string.Format("{0:D2}:{1:D2}:{2:d2}", hour, minute, second);
    }

    //public static void CameraFade(System.Action callback)
    //{
    //    GameObject.Find("FadePanel").GetComponent<Image>().DOFade(1.0f, 0.5f).OnComplete(() =>
    //    {
    //        if (callback != null)
    //        {
    //            callback();
    //        }
    //    });
    //}

    public static GameObject CreateGameObject(string path, Transform root)
    {
        GameObject go = GameObject.Instantiate(Resources.Load(path)) as GameObject;
        if (go == null)
        {
            Debug.LogError("can not find the go:" + path);
            return go;
        }

        Transform s_tran = go.transform;
        s_tran.SetParent(root);
        s_tran.localPosition = Vector3.zero;
        s_tran.localRotation = Quaternion.Euler(Vector3.zero);
        s_tran.localScale = Vector3.one;
        return go;
    }

    #region 数据解密
    private const string DecryptKey = "AEFG1024HJKE";
    public static void Decryption(byte[] data)
    {
        packXor(data, data.Length, DecryptKey);
    }

    static void packXor(byte[] _data, int _len, string _pstr)
    {
        int length = _len;
        int strCount = 0;

        for (int i = 0; i < length; ++i)
        {
            if (strCount >= _pstr.Length)
                strCount = 0;
            _data[i] ^= (byte)_pstr[strCount++];
        }
    }
    #endregion

    public static string GetStreamingAssetPath()
    {
        string streamingAssetsPath = string.Empty;
#if UNITY_EDITOR
        streamingAssetsPath = "file://" + Application.streamingAssetsPath;
#elif UNITY_IPHONE && !UNITY_EDITOR
        streamingAssetsPath = Application.dataPath +"/Raw";
#elif UNITY_ANDROID && !UNITY_EDITOR
        streamingAssetsPath = "jar:file://" + Application.dataPath + "!/assets";
#endif
        Debug.Log("st path:" + streamingAssetsPath);
        return streamingAssetsPath;
    }

    public static string GetMd5(string path)
    {
        FileStream fs = new FileStream(path, FileMode.Open, FileAccess.ReadWrite);
        byte[] buff = new byte[fs.Length];
        fs.Read(buff, 0, (int)fs.Length);
        fs.Close();

        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
        byte[] bytHash;
        bytHash = md5.ComputeHash(buff);
        md5.Clear();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < bytHash.Length; i++)
        {
            sb.Append(bytHash[i].ToString("X").PadLeft(2, '0'));
        }
        return sb.ToString();
    }


    public static string GetCurScenceName()
    {
        return UnityEngine.SceneManagement.SceneManager.GetActiveScene().name;
    }
}