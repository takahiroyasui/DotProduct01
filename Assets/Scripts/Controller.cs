using UnityEngine;
using UnityEngine.UI;

public class Controller : MonoBehaviour
{
    [SerializeField] Camera cam;
    [SerializeField] GameObject target;
    [SerializeField] Material red;
    [SerializeField] Material white;
    [SerializeField] Text debugText;
    private MeshRenderer targetMesh;

    void Start() {
        targetMesh = target.GetComponent<MeshRenderer>();
    }

    void Update() {
        var dot = Vector3.Dot(
            cam.transform.forward,
            (target.transform.position - cam.transform.position).normalized
        );

        var deg = Mathf.Acos(dot) * Mathf.Rad2Deg;
        debugText.text = $"{deg:F0}°";

        if (deg <= 15) {
            targetMesh.material = red;
        } else {
            targetMesh.material = white;
        }
    }
}
