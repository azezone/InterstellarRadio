﻿Shader "Custom/debris" {
	SubShader {
   		Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha // alpha blending
//		Blend SrcAlpha One 				// alpha additive
		
        Pass {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
 			#pragma target 3.0
 
 			
 			#include "UnityCG.cginc"

 			struct appdata_custom {
				float4 vertex : POSITION;
				fixed4 color : COLOR;
				float4 texcoord : TEXCOORD0;
			};

 			struct v2f
 			{
 				float4 pos:SV_POSITION;
 				fixed4 color:COLOR;
 			};
 			
 			float4x4 _PrevInvMatrix;
			float3   _TargetPosition;
			float    _Range;//雨滴的范围
			float    _RangeR;//_Range的倒数
			float    _MoveTotal;//整体雨滴的移动位移
			float    _Move;//每一帧的整体雨滴的移动位移
   
            v2f vert(appdata_custom v)
            {
				v.vertex.y += _MoveTotal;
				float3 target = _TargetPosition;
				float3 trip;
				trip = floor( ((target - v.vertex.xyz)*_RangeR + 1) * 0.5 );
				trip *= (_Range * 2);
				v.vertex.xyz += trip;

            	float4 tv0 = v.vertex * v.texcoord.x;
            	tv0 = mul (UNITY_MATRIX_MVP, tv0);
            	
				v.vertex.y -= _Move;
            	float4 tv1 = v.vertex * v.texcoord.y;
            	tv1 = mul (UNITY_MATRIX_MV, tv1);
            	tv1 = mul (_PrevInvMatrix, tv1);
            	tv1 = mul (UNITY_MATRIX_P, tv1);
            	
            	v2f o;
            	o.pos = tv0 + tv1;
            	float depth = o.pos.z * 0.02;
            	float normalized_depth = (1 - depth);
            	o.color = v.color;
            	o.color.a *= (normalized_depth);
            	return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                return i.color;
            }

            ENDCG
        }
    }
}