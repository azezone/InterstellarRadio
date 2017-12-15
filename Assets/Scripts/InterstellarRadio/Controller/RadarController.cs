using UnityEngine;
using InterstellarRadio.Model;

public class RadarController : MonoBehaviour
{
    public static RadarController instance = null;
    private Animator _Animator;

    private void Awake()
    {
        if (instance != null && instance != this)
        {
            DestroyImmediate(instance);
        }

        instance = this;
    }

    private void Start()
    {
        _Animator = gameObject.GetComponent<Animator>();
    }

    /// <summary>
    /// 开启一次搜索
    /// </summary>
    public void Search(ResultType type)
    {
        _Animator.SetBool("switch", true);
        ResultShower.instance.Show(type);

        Ftimer.AddEvent("autooff", 1f, () =>
        {
           _Animator.SetBool("switch", false);
        });
    }
}