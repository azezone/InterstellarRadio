using System;

namespace InterstellarRadio.Model
{
    public enum ResultType
    {
        none = 0,
        video = 1,
        voice = 2,
        game = 3,
        picture = 4,
        lable = 5
    }

    public class EventDaTA
    {
        public ResultType eType;
        public string eData;
    }

    [Serializable]
    public class VideoData
    {
        public string title;
        public string url;
    }

    public class VoiceData
    {

    }

    [Serializable]
    public class GameData
    {
        public string title;
        public string url;
    }

    [Serializable]
    public class PictureData
    {
        public string title;
        public string url;
    }

    [Serializable]
    public class LableData
    {
        public string title;
        public string url;
    }
}
