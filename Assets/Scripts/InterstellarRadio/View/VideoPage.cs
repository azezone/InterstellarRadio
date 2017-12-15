using UnityEngine;

public class VideoPage : ResultPageBase
{
    [SerializeField]
    private MediaPlayerCtrl _VideoPlayer;
    private Animator _Animator;


    private void Start()
    {
        _VideoPlayer.m_strFileName = string.Empty;
        _Animator = gameObject.GetComponent<Animator>();
    }

    public void PlayAVideo(VideoItem data)
    {
        if (data == null)
        {
            return;
        }

        Show();

        if (string.IsNullOrEmpty(_VideoPlayer.m_strFileName))
        {
            _VideoPlayer.m_strFileName = data.url;
        }
        else
        {
            _VideoPlayer.Load(data.url);
        }
        _VideoPlayer.Play();

        _VideoPlayer.OnEnd += () =>
        {
            Hide();
        };
    }

    public void Show()
    {
        _Animator.SetBool("switch", true);
    }

    public void Hide()
    {
        _Animator.SetBool("switch", false);
    }
}
