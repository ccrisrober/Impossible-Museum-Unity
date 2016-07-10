Shader "Example/StencilPlaneMask"
{
	Properties
	{
		_StencilMask("Stencil Mask", Int) = 0
	}
	SubShader
	{
		Tags
		{
			"RenderType" = "Opaque"
			"Queue" = "Geometry-666"		// Force plane draw first than model!!
		}
		ColorMask 0
		ZWrite off
		Stencil
		{
			Ref[_StencilMask]
			Comp always
			Pass replace
			Fail keep
		}

		Pass
		{
			CGPROGRAM
			// Override vertex-fragment shaders
			#pragma vertex vert
			#pragma fragment frag

			struct vertex_input
			{
				float4 vertex : POSITION;
			};

			struct vertex_output
			{
				float4 position : SV_POSITION;
			};

			vertex_output vert(vertex_input vs_data)
			{
				vertex_output vo;
				vo.position = mul(UNITY_MATRIX_MVP, vs_data.vertex);
				return vo;
			}

			half4 frag(vertex_output i) : COLOR
			{
				return half4(0, 0, 0, 1);
			}
			ENDCG
		}
	}
}