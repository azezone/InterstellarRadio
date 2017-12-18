using UnityEngine;
using UnityEngine.UI;
using InterstellarRadio.Model;

public class PanelComputer : MonoBehaviour
{
    //[SerializeField]
    //Button mSearchButton;
    public InterfaceAnimManager[] interfaces;
    public Button[] buttons;
    private InterfaceAnimManager current;
    private int curPos = 0;

    private void Start()
    {
        InitButtons();
        //InitInterfaceAnimManagers();

        //Ftimer.AddEvent("autostartmovie",2f,()=> {
        //    OprateButtonEvent("Movie");
        //});

        //Ftimer.AddEvent("autostartui", 8f, () => {
        //    OprateButtonEvent("Image");
        //});
    }

    bool flag = false;
    private void Update()
    {
        if (Input.anyKeyDown)
        {
            if (flag)
            {
                OprateButtonEvent("Movie");
            }
            else
            {
                OprateButtonEvent("Image");
            }
            flag = !flag;
        }
    }

    private void InitButtons()
    {
        GameObject go = GameObject.Find("buttons");
        buttons = go.GetComponentsInChildren<Button>();
        for (int i = 0; i < buttons.Length; i++)
        {
            string name = buttons[i].gameObject.name;
            Button.ButtonClickedEvent btn_event = new Button.ButtonClickedEvent();
            btn_event.AddListener(() =>
            {
                OprateButtonEvent(name);
            });
            buttons[i].onClick = btn_event;
        }
    }

    private void InitInterfaceAnimManagers()
    {
        GameObject go = GameObject.Find("HoloInterfaces");
        interfaces = go.GetComponentsInChildren<InterfaceAnimManager>();
    }

    private void OprateButtonEvent(string name)
    {
        if (name.Equals("Movie"))
        {
            if (current)
            {
                current.startDisappear(true);
            }
            ResultShower.instance.Show(ResultType.video);
        }
        else if (name.Equals("Voice"))
        {

        }
        else if (name.Equals("Image"))
        {
            ResultShower.instance.videoPlayer.Hide();
            if (current)
            {
                current.startDisappear(true);
            }
            if (curPos == interfaces.Length - 1)
            {
                curPos = 0;
            }
            current = interfaces[curPos++];
            if (current)
            {
                current.gameObject.SetActive(true);
                current.startAppear();
            }
        }
        else if (name.Equals("Words"))
        {

        }
        else if (name.Equals("Object"))
        {

        }

    }
}