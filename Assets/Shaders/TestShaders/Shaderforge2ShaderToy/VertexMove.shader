// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33882,y:32883,varname:node_3138,prsc:2|emission-2481-OUT,clip-6438-OUT,refract-5865-OUT,voffset-8753-OUT;n:type:ShaderForge.SFN_Tex2d,id:2823,x:31817,y:33134,ptovrint:False,ptlb:TexMove,ptin:_TexMove,varname:node_2823,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a1a169f1c3c647b49ab00087cb19c0f7,ntxv:0,isnm:False|UVIN-6105-OUT;n:type:ShaderForge.SFN_NormalVector,id:3713,x:31817,y:33387,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:8753,x:32432,y:33455,varname:node_8753,prsc:2|A-2823-G,B-3713-OUT,C-3733-OUT;n:type:ShaderForge.SFN_Slider,id:3733,x:31778,y:33572,ptovrint:False,ptlb:WaveIntensity,ptin:_WaveIntensity,varname:node_3733,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2713602,max:1;n:type:ShaderForge.SFN_TexCoord,id:7069,x:30803,y:33035,varname:node_7069,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:35,x:31044,y:33021,varname:node_35,prsc:2,spu:0.2,spv:0.1|UVIN-7069-UVOUT;n:type:ShaderForge.SFN_Panner,id:3439,x:31044,y:33218,varname:node_3439,prsc:2,spu:0.1,spv:0.2|UVIN-7069-UVOUT;n:type:ShaderForge.SFN_Add,id:7380,x:31262,y:33094,varname:node_7380,prsc:2|A-35-UVOUT,B-3439-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6105,x:31550,y:33137,varname:node_6105,prsc:2|A-7380-OUT,B-9493-OUT;n:type:ShaderForge.SFN_Slider,id:9493,x:31217,y:33364,ptovrint:False,ptlb:WaveSpeed,ptin:_WaveSpeed,varname:node_9493,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3874209,max:1;n:type:ShaderForge.SFN_Tex2d,id:7995,x:32240,y:32828,ptovrint:False,ptlb:TexInside,ptin:_TexInside,varname:_node_2823_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a1a169f1c3c647b49ab00087cb19c0f7,ntxv:0,isnm:False|UVIN-5467-OUT;n:type:ShaderForge.SFN_TexCoord,id:6550,x:31477,y:32652,varname:node_6550,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:5916,x:31815,y:32795,varname:node_5916,prsc:2,spu:0.1,spv:0|UVIN-6550-UVOUT;n:type:ShaderForge.SFN_Add,id:5467,x:32016,y:32948,varname:node_5467,prsc:2|A-5916-UVOUT,B-2823-R;n:type:ShaderForge.SFN_Color,id:1052,x:32240,y:33022,ptovrint:False,ptlb:color,ptin:_color,varname:node_1052,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:6341,x:32524,y:32829,varname:node_6341,prsc:2|A-7995-RGB,B-1052-RGB;n:type:ShaderForge.SFN_Lerp,id:2481,x:32933,y:32850,varname:node_2481,prsc:2|A-3532-RGB,B-6341-OUT,T-5288-OUT;n:type:ShaderForge.SFN_Tex2d,id:3532,x:32282,y:32642,ptovrint:False,ptlb:TexMain,ptin:_TexMain,varname:node_3532,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:11e5aa6a9abe3e548ba05a3db33962c0,ntxv:0,isnm:False|UVIN-6550-UVOUT;n:type:ShaderForge.SFN_Slider,id:5288,x:32464,y:33034,ptovrint:False,ptlb:LerpR,ptin:_LerpR,varname:node_5288,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4371117,max:1;n:type:ShaderForge.SFN_Fresnel,id:1770,x:32507,y:33164,varname:node_1770,prsc:2|EXP-4773-OUT;n:type:ShaderForge.SFN_If,id:6182,x:32954,y:33240,varname:node_6182,prsc:2|A-1770-OUT,B-4653-OUT,GT-7128-OUT,EQ-7128-OUT,LT-7128-OUT;n:type:ShaderForge.SFN_Vector1,id:4653,x:32507,y:33279,varname:node_4653,prsc:2,v1:0.6;n:type:ShaderForge.SFN_Vector1,id:7128,x:32507,y:33371,varname:node_7128,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Vector1,id:4773,x:32281,y:33213,varname:node_4773,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:7640,x:33162,y:33046,varname:node_7640,prsc:2|A-5012-OUT,B-2221-OUT;n:type:ShaderForge.SFN_Slider,id:2221,x:32797,y:33125,ptovrint:False,ptlb:node_2221,ptin:_node_2221,varname:node_2221,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6701061,max:1;n:type:ShaderForge.SFN_ComponentMask,id:5865,x:33413,y:33046,varname:node_5865,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-7640-OUT;n:type:ShaderForge.SFN_Vector2,id:5012,x:32907,y:32998,varname:node_5012,prsc:2,v1:1,v2:1;n:type:ShaderForge.SFN_LightColor,id:6965,x:32953,y:33720,varname:node_6965,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:8581,x:32701,y:33509,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:4324,x:32701,y:33667,varname:node_4324,prsc:2;n:type:ShaderForge.SFN_Dot,id:793,x:32953,y:33548,varname:node_793,prsc:2,dt:1|A-8581-OUT,B-4324-OUT;n:type:ShaderForge.SFN_Multiply,id:715,x:33336,y:33514,varname:node_715,prsc:2|A-793-OUT,B-6965-RGB,C-2797-OUT;n:type:ShaderForge.SFN_Slider,id:2797,x:32781,y:33909,ptovrint:False,ptlb:node_2797,ptin:_node_2797,varname:node_2797,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.645296,max:2;n:type:ShaderForge.SFN_Slider,id:6438,x:33199,y:33298,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_6438,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5753096,max:1;proporder:3532-7995-2823-1052-3733-9493-5288-2221-2797-6438;pass:END;sub:END;*/

Shader "Shader Forge/VertexMove" {
    Properties {
        _TexMain ("TexMain", 2D) = "white" {}
        _TexInside ("TexInside", 2D) = "white" {}
        _TexMove ("TexMove", 2D) = "white" {}
        _color ("color", Color) = (1,1,1,1)
        _WaveIntensity ("WaveIntensity", Range(0, 1)) = 0.2713602
        _WaveSpeed ("WaveSpeed", Range(0, 1)) = 0.3874209
        _LerpR ("LerpR", Range(0, 1)) = 0.4371117
        _node_2221 ("node_2221", Range(0, 1)) = 0.6701061
        _node_2797 ("node_2797", Range(0, 2)) = 0.645296
        _alpha ("alpha", Range(0, 1)) = 0.5753096
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
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform sampler2D _GrabTexture;
            uniform float4 _TimeEditor;
            uniform sampler2D _TexMove; uniform float4 _TexMove_ST;
            uniform float _WaveIntensity;
            uniform float _WaveSpeed;
            uniform sampler2D _TexInside; uniform float4 _TexInside_ST;
            uniform float4 _color;
            uniform sampler2D _TexMain; uniform float4 _TexMain_ST;
            uniform float _LerpR;
            uniform float _node_2221;
            uniform float _alpha;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 screenPos : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_8966 = _Time + _TimeEditor;
                float2 node_6105 = (((o.uv0+node_8966.g*float2(0.2,0.1))+(o.uv0+node_8966.g*float2(0.1,0.2)))*_WaveSpeed);
                float4 _TexMove_var = tex2Dlod(_TexMove,float4(TRANSFORM_TEX(node_6105, _TexMove),0.0,0));
                v.vertex.xyz += (_TexMove_var.g*v.normal*_WaveIntensity);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
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
                float3 normalDirection = i.normalDir;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (float2(1,1)*_node_2221).rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                clip(_alpha - 0.5);
////// Lighting:
////// Emissive:
                float4 _TexMain_var = tex2D(_TexMain,TRANSFORM_TEX(i.uv0, _TexMain));
                float4 node_8966 = _Time + _TimeEditor;
                float2 node_6105 = (((i.uv0+node_8966.g*float2(0.2,0.1))+(i.uv0+node_8966.g*float2(0.1,0.2)))*_WaveSpeed);
                float4 _TexMove_var = tex2D(_TexMove,TRANSFORM_TEX(node_6105, _TexMove));
                float2 node_5467 = ((i.uv0+node_8966.g*float2(0.1,0))+_TexMove_var.r);
                float4 _TexInside_var = tex2D(_TexInside,TRANSFORM_TEX(node_5467, _TexInside));
                float3 emissive = lerp(_TexMain_var.rgb,(_TexInside_var.rgb*_color.rgb),_LerpR);
                float3 finalColor = emissive;
                return fixed4(lerp(sceneColor.rgb, finalColor,1),1);
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
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _TexMove; uniform float4 _TexMove_ST;
            uniform float _WaveIntensity;
            uniform float _WaveSpeed;
            uniform float _alpha;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_9961 = _Time + _TimeEditor;
                float2 node_6105 = (((o.uv0+node_9961.g*float2(0.2,0.1))+(o.uv0+node_9961.g*float2(0.1,0.2)))*_WaveSpeed);
                float4 _TexMove_var = tex2Dlod(_TexMove,float4(TRANSFORM_TEX(node_6105, _TexMove),0.0,0));
                v.vertex.xyz += (_TexMove_var.g*v.normal*_WaveIntensity);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                clip(_alpha - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
