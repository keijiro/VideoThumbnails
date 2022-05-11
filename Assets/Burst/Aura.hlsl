#include "Packages/jp.keijiro.noiseshader/Shader/SimplexNoise2D.hlsl"

void Aura_float(UnityTexture2D Tex, UnitySamplerState SS, float2 UV, out float3 Out)
{
    float2 uv = UV;
    float3 acc = 0;

    for (uint i = 0; i < 32; i++)
    {
        float r = SimplexNoise(uv * 10) * 0.9;
        float a = SimplexNoise(uv * 10 + 100) * 0.9;

        float2x2 mat = float2x2(cos(r), -sin(r), sin(r), cos(r));
        float2 disp = mul(mat, float2(0.8, 0.6));

        uv += disp * 0.012 * (1 + a * 0.3);
        float2 uv2 = (uv - 0.5) * 2 + 0.5;

        float4 c = SAMPLE_TEXTURE2D(Tex, SS, uv2);
        acc += c.rgb * c.a * (1 - i / 32.0);
    }

    Out = saturate(acc / 16);
}
