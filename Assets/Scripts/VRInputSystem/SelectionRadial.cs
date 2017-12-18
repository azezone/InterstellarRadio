using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System;

namespace VRStandardAssets.Utils
{
    // This class is used to control a radial bar that fills
    // up as the user holds down the Fire1 button.  When it has
    // finished filling it triggers an event.  It also has a
    // coroutine which returns once the bar is filled.
    public class SelectionRadial : MonoBehaviour
    {
        public event Action OnSelectionComplete;
        [SerializeField]
        private float m_SelectionDuration = 2f;                                // How long it takes for the bar to fill.
        [SerializeField]
        private bool m_HideOnStart = true;                                     // Whether or not the bar should be visible at the start.
        [SerializeField]
        private Image m_Selection;                                             // Reference to the image who's fill amount is adjusted to display the bar.
        [SerializeField]
        private VRInput m_VRInput;                                             // Reference to the VRInput so that input events can be subscribed to.

        private Coroutine m_SelectionFillRoutine;                                               // Used to start and stop the filling coroutine based on input.
        private bool m_IsSelectionRadialActive;                                                    // Whether or not the bar is currently useable.
        private bool m_RadialFilled;                                                               // Used to allow the coroutine to wait for the bar to fill.

        public float SelectionDuration { get { return m_SelectionDuration; } }

        private void OnEnable()
        {
            m_VRInput.OnDown += HandleDown;
            m_VRInput.OnUp += HandleUp;
        }

        private void OnDisable()
        {
            m_VRInput.OnDown -= HandleDown;
            m_VRInput.OnUp -= HandleUp;
        }

        private void Start()
        {
            // Setup the radial to have no fill at the start and hide if necessary.
            m_Selection.fillAmount = 0f;

            if (m_HideOnStart) Hide();
        }

        public void Show()
        {
            m_Selection.gameObject.SetActive(true);
            m_IsSelectionRadialActive = true;
        }

        public void Hide()
        {
            ResetSelection();

            m_Selection.gameObject.SetActive(false);
            m_IsSelectionRadialActive = false;

            // This effectively resets the radial for when it's shown again.
            m_Selection.fillAmount = 0f;
        }

        private IEnumerator FillSelectionRadial()
        {
            // At the start of the coroutine, the bar is not filled.
            m_RadialFilled = false;

            // Create a timer and reset the fill amount.

            m_Selection.fillAmount = 0f;
            int totalDuration = (int)(m_SelectionDuration * 1000);
            System.TimeSpan startTime = new System.TimeSpan(DateTime.Now.Ticks);
            System.TimeSpan curTime, timeSpan;
            int timer = 0;
            //			Debuger.Log ("FillSelectionRadial: start");
            while (timer < totalDuration)
            {
                // The image's fill amount requires a value from 0 to 1 so we normalise the time.
                m_Selection.fillAmount = timer / (float)totalDuration;

                // Update timer by curTime and startTime
                curTime = new System.TimeSpan(DateTime.Now.Ticks);
                timeSpan = startTime.Subtract(curTime).Duration();
                timer = timeSpan.Seconds * 1000 + timeSpan.Milliseconds;

                //				Debuger.Log ("FillSelectionRadial: timer:" + timer + " :totalDuration" + totalDuration+ " :fillAmount" + m_Selection.fillAmount);
                yield return null;
            }
            //			Debuger.Log ("FillSelectionRadial: end");
            // When the loop is finished set the fill amount to be full.
            m_Selection.fillAmount = 0f;

            // Turn off the radial so it can only be used once.
            m_IsSelectionRadialActive = false;

            // The radial is now filled so the coroutine waiting for it can continue.
            m_RadialFilled = true;

            // If there is anything subscribed to OnSelectionComplete call it.

            if (OnSelectionComplete != null)
            {

                OnSelectionComplete();
            }
        }

        private IEnumerator WaitForSelectionRadialToFill()
        {
            // Set the radial to not filled in order to wait for it.
            m_RadialFilled = false;

            // Make sure the radial is visible and usable.
            Show();

            // Check every frame if the radial is filled.
            while (!m_RadialFilled)
            {
                yield return null;
            }

            // Once it's been used make the radial invisible.
            Hide();
        }

        public void HandleDown()
        {
            // If the radial is active start filling it.
            if (m_IsSelectionRadialActive)
            {
                ResetSelection();
                m_SelectionFillRoutine = StartCoroutine(FillSelectionRadial());
            }
        }

        public void HandleUp()
        {
            ResetSelection();
        }

        public void ResetSelection()
        {
            if (m_SelectionFillRoutine != null)
            {
                StopCoroutine(m_SelectionFillRoutine);
                m_SelectionFillRoutine = null;
            }

            m_Selection.fillAmount = 0f;
        }
    }
}