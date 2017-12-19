// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33780,y:32473,varname:node_3138,prsc:2|emission-1255-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:33042,y:32379,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3014706,c3:0.5955882,c4:1;n:type:ShaderForge.SFN_TexCoord,id:641,x:32471,y:32673,varname:node_641,prsc:2,uv:0;n:type:ShaderForge.SFN_Distance,id:5434,x:32639,y:32557,varname:node_5434,prsc:2|A-555-OUT,B-641-UVOUT;n:type:ShaderForge.SFN_Vector2,id:555,x:32471,y:32541,varname:node_555,prsc:2,v1:0.8,v2:0.8;n:type:ShaderForge.SFN_Add,id:372,x:32821,y:32616,varname:node_372,prsc:2|A-4360-OUT,B-5434-OUT;n:type:ShaderForge.SFN_Vector1,id:4360,x:32639,y:32478,varname:node_4360,prsc:2,v1:-0.1;n:type:ShaderForge.SFN_Vector1,id:8939,x:32824,y:32754,varname:node_8939,prsc:2,v1:0;n:type:ShaderForge.SFN_Step,id:90,x:33042,y:32720,varname:node_90,prsc:2|A-372-OUT,B-8939-OUT;n:type:ShaderForge.SFN_Color,id:5672,x:33042,y:32551,ptovrint:False,ptlb:node_5672,ptin:_node_5672,varname:node_5672,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Step,id:295,x:33042,y:32888,varname:node_295,prsc:2|A-167-OUT,B-8021-OUT;n:type:ShaderForge.SFN_Add,id:167,x:32824,y:33013,varname:node_167,prsc:2|A-7000-OUT,B-6564-OUT;n:type:ShaderForge.SFN_Vector1,id:8021,x:32824,y:33151,varname:node_8021,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:7000,x:32642,y:32875,varname:node_7000,prsc:2,v1:-0.1;n:type:ShaderForge.SFN_Distance,id:6564,x:32642,y:32954,varname:node_6564,prsc:2|A-260-OUT,B-1631-UVOUT;n:type:ShaderForge.SFN_Vector2,id:260,x:32474,y:32938,varname:node_260,prsc:2,v1:0.2,v2:0.2;n:type:ShaderForge.SFN_TexCoord,id:1631,x:32474,y:33070,varname:node_1631,prsc:2,uv:0;n:type:ShaderForge.SFN_Lerp,id:1255,x:33484,y:32566,varname:node_1255,prsc:2|A-7241-RGB,B-5672-RGB,T-1006-OUT;n:type:ShaderForge.SFN_If,id:2458,x:33454,y:32317,varname:node_2458,prsc:2;n:type:ShaderForge.SFN_If,id:1006,x:33298,y:32753,varname:node_1006,prsc:2|A-90-OUT,B-295-OUT,GT-90-OUT,EQ-90-OUT,LT-295-OUT;proporder:7241-5672;pass:END;sub:END;*/

Shader "Shader Forge/Circle" {
    Properties {
        _Color ("Color", Color) = (0.07843138,0.3014706,0.5955882,1)
        _node_5672 ("node_5672", Color) = (1,0,0,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float4 _node_5672;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float node_90 = step(((-0.1)+distance(float2(0.8,0.8),i.uv0)),0.0);
                float node_295 = step(((-0.1)+distance(float2(0.2,0.2),i.uv0)),0.0);
                float node_1006_if_leA = step(node_90,node_295);
                float node_1006_if_leB = step(node_295,node_90);
                float3 emissive = lerp(_Color.rgb,_node_5672.rgb,lerp((node_1006_if_leA*node_295)+(node_1006_if_leB*node_90),node_90,node_1006_if_leA*node_1006_if_leB));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
