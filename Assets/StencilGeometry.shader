Shader "Example/StencilModelGeom" {
	Properties {
		_StencilMask("Stencil Mask", Int) = 0
		_MainTex ("Texture (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { 
			"RenderType"="Opaque"
		}
		Stencil

		{
			Ref[_StencilMask]
			Comp equal
			Pass keep
			Fail keep
		}

		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
