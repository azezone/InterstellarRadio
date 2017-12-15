using UnityEngine;
using System.Collections;


public class Radar : MonoBehaviour
{
    void Update()
    {
        transform.Rotate(new Vector3(0, Time.deltaTime * 100, 0));
    }
}