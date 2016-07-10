using UnityEngine;
using System.Collections;

public class RotateScript : MonoBehaviour {
	void FixedUpdate () {
        transform.Rotate(new Vector3(0.0f, 0.5f, 0.0f));
	}
}
