#ifndef _EVALUATE_GRADIENT_HEADERS_
#include "Packages/jp.keijiro.klak.cosinegradient/Runtime/CosineGradient.hlsl"
#include "Packages/jp.keijiro.noiseshader/Shader/SimplexNoise2D.hlsl"
#define _EVALUATE_GRADIENT_HEADERS_
#endif

void EvaluateGradient_float
  (float2 uv, float2 stripe, float freq, float disp, float2 offs, float4x4 gradient,
   out float3 output)
{
    float d = floor(dot(uv, stripe) + SimplexNoise(uv * freq + offs) * disp);
    float n = SimplexNoise(uv + d + offs + 100) / 2 + 0.5;
    output = CosineGradient(gradient, n);
}
