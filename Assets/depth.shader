Shader "Custom/depth"
{
	SubShader {

		Tags { "RenderType"="Opatue" }
		LOD 100

		Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			// デプスバッファのテクスチャを宣言
			sampler2D _CameraDepthTexture;

			struct appdata {
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f {
				float4 vertex : SV_POSITION;
				float2 uv : TEXCOORD0;
			};

			v2f vert(appdata v) {
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}

			fixed4 frag(v2f i) : SV_TARGET {
				// フラグメントシェーダでtex2D関数を使ってデプスバッファからZ値を取り出す
				fixed depth = UNITY_SAMPLE_DEPTH(tex2D(_CameraDepthTexture, i.uv)) * 1.5;
				return fixed4(depth, depth, depth, 1);
			}

			ENDCG
		}

	}

	FallBack "Diffuse" 
}
