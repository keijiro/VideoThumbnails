using UnityEngine;
using Klak.Chromatics;

[ExecuteInEditMode]
sealed class GradientBG : MonoBehaviour
{
    [SerializeField] string _propertyName = "_Gradient";
    [SerializeField] CosineGradient _gradient;

    MaterialPropertyBlock _sheet;

    void Update()
    {
        if (_sheet == null) _sheet = new MaterialPropertyBlock();
        var r = GetComponent<Renderer>();
        r.GetPropertyBlock(_sheet);
        _sheet.SetMatrix(_propertyName, _gradient);
        r.SetPropertyBlock(_sheet);
    }
}
