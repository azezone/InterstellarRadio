using System;
using System.Xml.Serialization;

[Serializable]
public class ResultConfig
{
    public VideoItem[] videos;
    public ImageItem[] images;
    public LableItem[] lables;
    public ObjItem[] objs;
}

[Serializable]
public class VideoItem
{
    [XmlAttribute]
    public string name;
    [XmlAttribute]
    public string url;
}

[Serializable]
public class ImageItem
{
    [XmlAttribute]
    public string name;
    [XmlAttribute]
    public string url;
}

[Serializable]
public class LableItem
{
    [XmlAttribute]
    public string name;
    [XmlAttribute]
    public string content;
}

[Serializable]
public class ObjItem
{
    [XmlAttribute]
    public string name;
    [XmlAttribute]
    public string path;
    [XmlAttribute]
    public string conscribe;
}