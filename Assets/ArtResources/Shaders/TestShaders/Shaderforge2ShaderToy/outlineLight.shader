// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:33198,y:32831,varname:node_9361,prsc:2|custl-4187-OUT;n:type:ShaderForge.SFN_Tex2d,id:851,x:32641,y:32914,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:11e5aa6a9abe3e548ba05a3db33962c0,ntxv:3,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:4996,x:32186,y:32860,varname:node_4996,prsc:2;n:type:ShaderForge.SFN_Slider,id:366,x:32094,y:33032,ptovrint:False,ptlb:node_366,ptin:_node_366,varname:node_366,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1709402,max:1;n:type:ShaderForge.SFN_Multiply,id:2639,x:32451,y:32931,varname:node_2639,prsc:2|A-4996-OUT,B-366-OUT;n:type:ShaderForge.SFN_Slider,id:7994,x:32264,y:33375,ptovrint:False,ptlb:node_366_copy,ptin:_node_366_copy,varname:_node_366_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.529915,max:10;n:type:ShaderForge.SFN_Multiply,id:2039,x:32641,y:33110,varname:node_2039,prsc:2|A-2639-OUT,B-4957-RGB,C-7994-OUT;n:type:ShaderForge.SFN_Add,id:4187,x:32917,y:32968,varname:node_4187,prsc:2|A-851-RGB,B-2039-OUT;n:type:ShaderForge.SFN_Color,id:4957,x:32378,y:33189,ptovrint:False,ptlb:node_4957,ptin:_node_4957,varname:node_4957,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9206896,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_TexCoord,id:8797,x:30824,y:32295,varname:node_8797,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:649,x:31095,y:32292,varname:node_649,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-8797-UVOUT;n:type:ShaderForge.SFN_Time,id:2546,x:30824,y:32496,varname:node_2546,prsc:2;n:type:ShaderForge.SFN_Code,id:6345,x:31102,y:32568,varname:node_6345,prsc:2,code:ZgBsAG8AYQB0ACAAdAB0ACAAPQAgAGYAbQBvAGQAKABpAEcAbABvAGIAYQBsAFQAaQBtAGUALAAxAC4ANQApAC8AMQAuADUAOwAgACAACgB0AHQAIAA9ACAAZgBtAG8AZAAoAGkARwBsAG8AYgBhAGwAVABpAG0AZQAsAF8ARAB1AHIAYQB0AGkAbwBuACkALwBfAEQAdQByAGEAdABpAG8AbgA7ACAAIAAKAGYAbABvAGEAdAAgAHMAcwAgAD0AIABwAG8AdwAoAHQAdAAsAC4AMgApACoAMAAuADUAIAArACAAMAAuADUAOwAgACAACgBzAHMAIAA9ACAAMQAuADAAIAArACAAcwBzACoAMAAuADUAKgBzAGkAbgAoAHQAdAAqADYALgAyADgAMwAxACoAMwAuADAAIAArACAAcAAuAHkAKgAwAC4ANQApACoAZQB4AHAAKAAtAHQAdAAqADQALgAwACkAOwAgACAACgBwACAAKgA9ACAAZgBsAG8AYQB0ADIAKAAwAC4ANQAsADEALgA1ACkAIAArACAAcwBzACoAZgBsAG8AYQB0ADIAKAAwAC4ANQAsAC0AMAAuADUAKQA7AAoAcgBlAHQAdQByAG4AIABwADsA,output:1,fname:animation,width:247,height:116,input:1,input:0,input:0,input_1_label:p,input_2_label:iGlobalTime,input_3_label:_Duration|A-649-OUT,B-2546-T,C-2536-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2536,x:30824,y:32706,ptovrint:False,ptlb:duration,ptin:_duration,varname:node_2558,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_TexCoord,id:980,x:31498,y:33121,varname:node_980,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:8733,x:31682,y:33121,varname:node_8733,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-980-UVOUT;n:type:ShaderForge.SFN_Time,id:1386,x:31498,y:33321,varname:node_1386,prsc:2;n:type:ShaderForge.SFN_Code,id:2073,x:31791,y:33345,varname:node_2073,prsc:2,code:,output:2,fname:Function_node_2073,width:247,height:132,input:1,input:0,input:0,input_1_label:p,input_2_label:iGlobalTime,input_3_label:_Duration|A-8733-OUT,B-1386-T,C-484-OUT;n:type:ShaderForge.SFN_Vector1,id:484,x:31498,y:33527,varname:node_484,prsc:2,v1:0;proporder:851-366-7994-4957;pass:END;sub:END;*/

Shader "Shader Forge/shockWave" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "bump" {}
        _node_366 ("node_366", Range(0, 1)) = 0.1709402
        _node_366_copy ("node_366_copy", Range(0, 10)) = 4.529915
        _node_4957 ("node_4957", Color) = (0.9206896,1,1,1)
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
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _node_366;
            uniform float _node_366_copy;
            uniform float4 _node_4957;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 finalColor = (_Diffuse_var.rgb+(((1.0-max(0,dot(normalDirection, viewDirection)))*_node_366)*_node_4957.rgb*_node_366_copy));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
