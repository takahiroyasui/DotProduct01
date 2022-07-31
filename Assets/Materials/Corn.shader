Shader "Custom/Corn"
{
    Properties {
        _Color ("Color", Color) = (1, 1, 1, 1)
        _AlphaParams ("Alpha Params", Range(0, 2)) = 0.5
    }

    SubShader {
        Tags { "Queue"="Transparent" }
        LOD 200

        CGPROGRAM

        #pragma surface surf Standard alpha:fade
        #pragma target 3.0

        struct Input {
            float3 worldNormal;
      		float3 viewDir;
        };

        fixed4 _Color;
        float _AlphaParams;

        void surf (Input IN, inout SurfaceOutputStandard o) {
            o.Albedo = _Color;
            float alpha = 1 - (abs(dot(IN.viewDir, IN.worldNormal)));
            o.Alpha = alpha * _AlphaParams;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
