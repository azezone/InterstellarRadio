// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:34323,y:32177,varname:node_9361,prsc:2|emission-5618-OUT,clip-8484-OUT,refract-8973-OUT,voffset-3869-OUT;n:type:ShaderForge.SFN_Tex2d,id:851,x:32360,y:32266,ptovrint:False,ptlb:TexMain,ptin:_TexMain,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:11e5aa6a9abe3e548ba05a3db33962c0,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:5927,x:32360,y:32451,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_AmbientLight,id:7528,x:32706,y:32555,varname:node_7528,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2460,x:32954,y:32490,cmnt:Ambient Light,varname:node_2460,prsc:2|A-544-OUT,B-7528-RGB;n:type:ShaderForge.SFN_Multiply,id:544,x:32558,y:32365,cmnt:Diffuse Color,varname:node_544,prsc:2|A-851-RGB,B-5927-RGB,C-1190-OUT;n:type:ShaderForge.SFN_Slider,id:688,x:32863,y:32781,ptovrint:False,ptlb:Reflection,ptin:_Reflection,varname:node_688,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3869613,max:1;n:type:ShaderForge.SFN_Multiply,id:5857,x:33539,y:32664,varname:node_5857,prsc:2|A-1742-OUT,B-688-OUT;n:type:ShaderForge.SFN_ComponentMask,id:8973,x:33721,y:32664,varname:node_8973,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-5857-OUT;n:type:ShaderForge.SFN_TexCoord,id:2705,x:32263,y:32061,varname:node_2705,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:4140,x:32472,y:32061,varname:node_4140,prsc:2,spu:0.2,spv:0.2|UVIN-2705-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:847,x:32676,y:32061,ptovrint:False,ptlb:Diffuse_copy,ptin:_Diffuse_copy,varname:_Diffuse_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a1a169f1c3c647b49ab00087cb19c0f7,ntxv:0,isnm:False|UVIN-4140-UVOUT;n:type:ShaderForge.SFN_Lerp,id:7338,x:33237,y:32261,varname:node_7338,prsc:2|A-847-G,B-2460-OUT,T-8946-OUT;n:type:ShaderForge.SFN_Slider,id:8946,x:32837,y:32348,ptovrint:False,ptlb:ApendIntensity,ptin:_ApendIntensity,varname:node_8946,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.7440696,max:1;n:type:ShaderForge.SFN_Fresnel,id:2923,x:32978,y:31822,varname:node_2923,prsc:2|EXP-7502-OUT;n:type:ShaderForge.SFN_Slider,id:7502,x:32574,y:31846,ptovrint:False,ptlb:FresnelR,ptin:_FresnelR,varname:node_7502,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8516092,max:3;n:type:ShaderForge.SFN_Multiply,id:3976,x:33600,y:31784,varname:node_3976,prsc:2|A-9384-RGB,B-1670-OUT;n:type:ShaderForge.SFN_Add,id:5013,x:33883,y:32030,varname:node_5013,prsc:2|A-3976-OUT,B-7338-OUT;n:type:ShaderForge.SFN_NormalVector,id:3737,x:33051,y:32946,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:7241,x:33537,y:32922,varname:node_7241,prsc:2|A-847-G,B-3737-OUT,C-1364-OUT;n:type:ShaderForge.SFN_Slider,id:1364,x:32972,y:33166,ptovrint:False,ptlb:WaveIntensity,ptin:_WaveIntensity,varname:node_1364,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.216237,max:2;n:type:ShaderForge.SFN_Vector1,id:1190,x:32360,y:32609,varname:node_1190,prsc:2,v1:3;n:type:ShaderForge.SFN_Vector2,id:1742,x:32923,y:32644,varname:node_1742,prsc:2,v1:1,v2:1;n:type:ShaderForge.SFN_Slider,id:8259,x:33257,y:32157,ptovrint:False,ptlb:node_8259,ptin:_node_8259,varname:node_8259,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:2;n:type:ShaderForge.SFN_Exp,id:9297,x:33359,y:31981,varname:node_9297,prsc:2,et:0|IN-8259-OUT;n:type:ShaderForge.SFN_Power,id:1670,x:33338,y:31826,varname:node_1670,prsc:2|VAL-2923-OUT,EXP-9297-OUT;n:type:ShaderForge.SFN_Multiply,id:5618,x:34107,y:32237,varname:node_5618,prsc:2|A-5013-OUT,B-2480-OUT;n:type:ShaderForge.SFN_Slider,id:2480,x:33738,y:32231,ptovrint:False,ptlb:brightness,ptin:_brightness,varname:_Alpha_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.47602,max:2;n:type:ShaderForge.SFN_AmbientLight,id:9384,x:33338,y:31666,varname:node_9384,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:3869,x:33749,y:32922,varname:node_3869,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.2|IN-7241-OUT;n:type:ShaderForge.SFN_Subtract,id:8484,x:34014,y:32395,varname:node_8484,prsc:2|A-4316-OUT,B-812-OUT;n:type:ShaderForge.SFN_Vector1,id:4316,x:33679,y:32342,varname:node_4316,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRange,id:812,x:33679,y:32428,varname:node_812,prsc:2,frmn:0,frmx:1,tomn:0,tomx:1|IN-1670-OUT;proporder:851-5927-688-847-8946-7502-1364-8259-2480;pass:END;sub:END;*/

Shader "Shader Forge/Newbubble" {
    Properties {
        _TexMain ("TexMain", 2D) = "white" {}
        _Color ("Color", Color) = (0.5,1,1,1)
        _Reflection ("Reflection", Range(0, 1)) = 0.3869613
        _Diffuse_copy ("Diffuse_copy", 2D) = "white" {}
        _ApendIntensity ("ApendIntensity", Range(0, 1)) = 0.7440696
        _FresnelR ("FresnelR", Range(0, 3)) = 0.8516092
        _WaveIntensity ("WaveIntensity", Range(0, 2)) = 1.216237
        _node_8259 ("node_8259", Range(0, 2)) = 0
        _brightness ("brightness", Range(0, 2)) = 1.47602
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
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
            #pragma glsl
            uniform sampler2D _GrabTexture;
            uniform float4 _TimeEditor;
            uniform sampler2D _TexMain; uniform float4 _TexMain_ST;
            uniform float4 _Color;
            uniform float _Reflection;
            uniform sampler2D _Diffuse_copy; uniform float4 _Diffuse_copy_ST;
            uniform float _ApendIntensity;
            uniform float _FresnelR;
            uniform float _WaveIntensity;
            uniform float _node_8259;
            uniform float _brightness;
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
                float4 screenPos : TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_31 = _Time + _TimeEditor;
                float2 node_4140 = (o.uv0+node_31.g*float2(0.2,0.2));
                float4 _Diffuse_copy_var = tex2Dlod(_Diffuse_copy,float4(TRANSFORM_TEX(node_4140, _Diffuse_copy),0.0,0));
                v.vertex.xyz += ((_Diffuse_copy_var.g*v.normal*_WaveIntensity)*0.2+0.0);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (float2(1,1)*_Reflection).rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float node_1670 = pow(pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelR),exp(_node_8259));
                clip((1.0-(node_1670*1.0+0.0)) - 0.5);
////// Lighting:
////// Emissive:
                float4 node_31 = _Time + _TimeEditor;
                float2 node_4140 = (i.uv0+node_31.g*float2(0.2,0.2));
                float4 _Diffuse_copy_var = tex2D(_Diffuse_copy,TRANSFORM_TEX(node_4140, _Diffuse_copy));
                float4 _TexMain_var = tex2D(_TexMain,TRANSFORM_TEX(i.uv0, _TexMain));
                float3 emissive = (((UNITY_LIGHTMODEL_AMBIENT.rgb*node_1670)+lerp(float3(_Diffuse_copy_var.g,_Diffuse_copy_var.g,_Diffuse_copy_var.g),((_TexMain_var.rgb*_Color.rgb*3.0)*UNITY_LIGHTMODEL_AMBIENT.rgb),_ApendIntensity))*_brightness);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,1),1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _Diffuse_copy; uniform float4 _Diffuse_copy_ST;
            uniform float _FresnelR;
            uniform float _WaveIntensity;
            uniform float _node_8259;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_2629 = _Time + _TimeEditor;
                float2 node_4140 = (o.uv0+node_2629.g*float2(0.2,0.2));
                float4 _Diffuse_copy_var = tex2Dlod(_Diffuse_copy,float4(TRANSFORM_TEX(node_4140, _Diffuse_copy),0.0,0));
                v.vertex.xyz += ((_Diffuse_copy_var.g*v.normal*_WaveIntensity)*0.2+0.0);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float node_1670 = pow(pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelR),exp(_node_8259));
                clip((1.0-(node_1670*1.0+0.0)) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
