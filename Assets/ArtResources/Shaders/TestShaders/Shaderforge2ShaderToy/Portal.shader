// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:32926,y:32522,varname:node_9361,prsc:2|emission-4729-OUT,alpha-788-OUT;n:type:ShaderForge.SFN_Tex2d,id:851,x:31804,y:32210,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9654cfdd87d7daf429b8931c28d7a93c,ntxv:2,isnm:False|UVIN-7419-OUT;n:type:ShaderForge.SFN_TexCoord,id:275,x:30174,y:32933,varname:node_275,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector2,id:7674,x:30174,y:33076,varname:node_7674,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:1893,x:30407,y:32992,varname:node_1893,prsc:2|A-275-UVOUT,B-7674-OUT;n:type:ShaderForge.SFN_If,id:788,x:32016,y:33020,varname:node_788,prsc:2|A-1893-OUT,B-1549-OUT,GT-2322-OUT,EQ-2322-OUT,LT-7519-OUT;n:type:ShaderForge.SFN_Vector1,id:2322,x:31607,y:33063,varname:node_2322,prsc:2,v1:1;n:type:ShaderForge.SFN_If,id:4729,x:32636,y:32638,varname:node_4729,prsc:2|A-788-OUT,B-8111-OUT,GT-851-RGB,EQ-851-RGB,LT-5890-OUT;n:type:ShaderForge.SFN_Vector1,id:8111,x:32444,y:32545,varname:node_8111,prsc:2,v1:1;n:type:ShaderForge.SFN_TexCoord,id:1310,x:31312,y:32501,varname:node_1310,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:4829,x:31882,y:32502,ptovrint:False,ptlb:node_6734_copy,ptin:_node_6734_copy,varname:_node_6734_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a1a169f1c3c647b49ab00087cb19c0f7,ntxv:0,isnm:False|UVIN-5789-UVOUT;n:type:ShaderForge.SFN_Slider,id:1442,x:31339,y:32723,ptovrint:False,ptlb:speed,ptin:_speed,varname:node_1442,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.512604,max:1;n:type:ShaderForge.SFN_Rotator,id:5789,x:31702,y:32515,varname:node_5789,prsc:2|UVIN-9117-UVOUT,SPD-1442-OUT;n:type:ShaderForge.SFN_Panner,id:9117,x:31516,y:32515,varname:node_9117,prsc:2,spu:0,spv:0.01|UVIN-1310-UVOUT;n:type:ShaderForge.SFN_If,id:7519,x:31414,y:33156,varname:node_7519,prsc:2|A-1893-OUT,B-2759-OUT,GT-9987-OUT,EQ-9987-OUT,LT-323-OUT;n:type:ShaderForge.SFN_Slider,id:2759,x:30697,y:33326,ptovrint:False,ptlb:round_inside,ptin:_round_inside,varname:node_2759,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2530593,max:0.5;n:type:ShaderForge.SFN_Vector1,id:6594,x:30407,y:33165,varname:node_6594,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:323,x:30865,y:33412,varname:node_323,prsc:2,v1:0.05;n:type:ShaderForge.SFN_Color,id:4166,x:31882,y:32714,ptovrint:False,ptlb:node_4166,ptin:_node_4166,varname:node_4166,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.003448284,c2:0.9191176,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:5890,x:32134,y:32589,varname:node_5890,prsc:2|A-4829-RGB,B-4166-RGB,C-9602-OUT;n:type:ShaderForge.SFN_Vector1,id:9602,x:31882,y:32875,varname:node_9602,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:1549,x:31528,y:32922,ptovrint:False,ptlb:round_outside,ptin:_round_outside,varname:_node_2759_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3850374,max:0.5;n:type:ShaderForge.SFN_Multiply,id:3328,x:30635,y:33131,varname:node_3328,prsc:2|A-1893-OUT,B-6594-OUT;n:type:ShaderForge.SFN_RemapRange,id:9987,x:30836,y:33131,varname:node_9987,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.3|IN-3328-OUT;n:type:ShaderForge.SFN_TexCoord,id:2689,x:31271,y:32120,varname:node_2689,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:7419,x:31572,y:32210,varname:node_7419,prsc:2|A-2689-UVOUT,B-4769-OUT;n:type:ShaderForge.SFN_Vector1,id:4769,x:31271,y:32307,varname:node_4769,prsc:2,v1:20;proporder:851-4829-1442-2759-4166-1549;pass:END;sub:END;*/

Shader "Shader Forge/Portal" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "black" {}
        _node_6734_copy ("node_6734_copy", 2D) = "white" {}
        _speed ("speed", Range(0, 1)) = 0.512604
        _round_inside ("round_inside", Range(0, 0.5)) = 0.2530593
        _node_4166 ("node_4166", Color) = (0.003448284,0.9191176,1,1)
        _round_outside ("round_outside", Range(0, 0.5)) = 0.3850374
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform sampler2D _node_6734_copy; uniform float4 _node_6734_copy_ST;
            uniform float _speed;
            uniform float _round_inside;
            uniform float4 _node_4166;
            uniform float _round_outside;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float node_1893 = distance(i.uv0,float2(0.5,0.5));
                float node_788_if_leA = step(node_1893,_round_outside);
                float node_788_if_leB = step(_round_outside,node_1893);
                float node_7519_if_leA = step(node_1893,_round_inside);
                float node_7519_if_leB = step(_round_inside,node_1893);
                float node_9987 = ((node_1893*2.0)*0.3+0.0);
                float node_2322 = 1.0;
                float node_788 = lerp((node_788_if_leA*lerp((node_7519_if_leA*0.05)+(node_7519_if_leB*node_9987),node_9987,node_7519_if_leA*node_7519_if_leB))+(node_788_if_leB*node_2322),node_2322,node_788_if_leA*node_788_if_leB);
                float node_4729_if_leA = step(node_788,1.0);
                float node_4729_if_leB = step(1.0,node_788);
                float4 node_4019 = _Time + _TimeEditor;
                float node_5789_ang = node_4019.g;
                float node_5789_spd = _speed;
                float node_5789_cos = cos(node_5789_spd*node_5789_ang);
                float node_5789_sin = sin(node_5789_spd*node_5789_ang);
                float2 node_5789_piv = float2(0.5,0.5);
                float2 node_5789 = (mul((i.uv0+node_4019.g*float2(0,0.01))-node_5789_piv,float2x2( node_5789_cos, -node_5789_sin, node_5789_sin, node_5789_cos))+node_5789_piv);
                float4 _node_6734_copy_var = tex2D(_node_6734_copy,TRANSFORM_TEX(node_5789, _node_6734_copy));
                float2 node_7419 = (i.uv0*20.0);
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(node_7419, _Diffuse));
                float3 emissive = lerp((node_4729_if_leA*(_node_6734_copy_var.rgb*_node_4166.rgb*1.0))+(node_4729_if_leB*_Diffuse_var.rgb),_Diffuse_var.rgb,node_4729_if_leA*node_4729_if_leB);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,node_788);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
