// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:1,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:2,bsrc:4,bdst:1,dpts:6,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:1,qpre:4,rntp:5,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:2865,x:32803,y:33093,varname:node_2865,prsc:2|emission-9968-OUT,voffset-4177-OUT;n:type:ShaderForge.SFN_TexCoord,id:6793,x:31729,y:33461,varname:node_6793,prsc:2,uv:0;n:type:ShaderForge.SFN_ProjectionParameters,id:8707,x:31729,y:33674,varname:node_8707,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:9496,x:31928,y:33461,varname:node_9496,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-6793-UVOUT;n:type:ShaderForge.SFN_Append,id:6538,x:31928,y:33633,varname:node_6538,prsc:2|A-5896-OUT,B-8707-SGN;n:type:ShaderForge.SFN_Vector1,id:5896,x:31729,y:33615,varname:node_5896,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:4177,x:32127,y:33531,varname:node_4177,prsc:2|A-9496-OUT,B-6538-OUT;n:type:ShaderForge.SFN_SceneColor,id:5557,x:31745,y:33003,varname:node_5557,prsc:2|UVIN-7643-OUT;n:type:ShaderForge.SFN_ScreenPos,id:1696,x:31347,y:32916,varname:node_1696,prsc:2,sctp:2;n:type:ShaderForge.SFN_Vector2,id:6146,x:30953,y:33060,varname:node_6146,prsc:2,v1:0.001,v2:0.001;n:type:ShaderForge.SFN_Add,id:7643,x:31555,y:33003,varname:node_7643,prsc:2|A-1696-UVOUT,B-5729-OUT;n:type:ShaderForge.SFN_SceneColor,id:9250,x:31745,y:33272,varname:node_9250,prsc:2|UVIN-5803-OUT;n:type:ShaderForge.SFN_ScreenPos,id:5991,x:31347,y:33185,varname:node_5991,prsc:2,sctp:2;n:type:ShaderForge.SFN_Vector2,id:9769,x:30953,y:33324,varname:node_9769,prsc:2,v1:-0.001,v2:-0.001;n:type:ShaderForge.SFN_Add,id:5803,x:31555,y:33272,varname:node_5803,prsc:2|A-5991-UVOUT,B-2071-OUT;n:type:ShaderForge.SFN_Add,id:6887,x:31965,y:33146,varname:node_6887,prsc:2|A-5557-RGB,B-9250-RGB;n:type:ShaderForge.SFN_Slider,id:2174,x:30796,y:33202,ptovrint:False,ptlb:node_2174,ptin:_node_2174,varname:node_2174,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:100;n:type:ShaderForge.SFN_Multiply,id:5729,x:31129,y:33124,varname:node_5729,prsc:2|A-6146-OUT,B-2174-OUT;n:type:ShaderForge.SFN_Multiply,id:2071,x:31177,y:33374,varname:node_2071,prsc:2|A-2174-OUT,B-9769-OUT;n:type:ShaderForge.SFN_ScreenPos,id:5146,x:31347,y:32745,varname:node_5146,prsc:2,sctp:2;n:type:ShaderForge.SFN_SceneColor,id:9682,x:31582,y:32755,varname:node_9682,prsc:2|UVIN-5146-UVOUT;n:type:ShaderForge.SFN_Lerp,id:9968,x:32290,y:33005,varname:node_9968,prsc:2|A-9682-RGB,B-6887-OUT,T-6784-OUT;n:type:ShaderForge.SFN_ScreenPos,id:737,x:31347,y:32494,varname:node_737,prsc:2,sctp:2;n:type:ShaderForge.SFN_Vector2,id:4632,x:31347,y:32380,varname:node_4632,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:1853,x:31577,y:32447,varname:node_1853,prsc:2|A-4632-OUT,B-737-UVOUT;n:type:ShaderForge.SFN_If,id:1217,x:31901,y:32444,varname:node_1217,prsc:2|A-1853-OUT,B-5307-OUT,GT-3478-OUT,EQ-3478-OUT,LT-9796-OUT;n:type:ShaderForge.SFN_Vector1,id:5307,x:31577,y:32369,varname:node_5307,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Vector1,id:9796,x:31577,y:32639,varname:node_9796,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Vector1,id:3478,x:31577,y:32574,varname:node_3478,prsc:2,v1:0.5;n:type:ShaderForge.SFN_RemapRange,id:6784,x:31911,y:32611,varname:node_6784,prsc:2,frmn:0,frmx:1,tomn:0,tomx:2|IN-1853-OUT;proporder:2174;pass:END;sub:END;*/

Shader "Shader Forge/VeatedRendering" {
    Properties {
        _node_2174 ("node_2174", Range(0, 100)) = 1
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Overlay+1"
            "RenderType"="Overlay"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend DstColor Zero
            Cull Off
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float _node_2174;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                v.vertex.xyz = float3(((o.uv0*2.0+-1.0)*float2(1.0,_ProjectionParams.r)),0.0);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = v.vertex;
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float node_1853 = distance(float2(0.5,0.5),sceneUVs.rg);
                float3 emissive = lerp(tex2D( _GrabTexture, sceneUVs.rg).rgb,(tex2D( _GrabTexture, (sceneUVs.rg+(float2(0.001,0.001)*_node_2174))).rgb+tex2D( _GrabTexture, (sceneUVs.rg+(_node_2174*float2(-0.001,-0.001)))).rgb),(node_1853*2.0+0.0));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float _node_2174;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 screenPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                v.vertex.xyz = float3(((o.uv0*2.0+-1.0)*float2(1.0,_ProjectionParams.r)),0.0);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : SV_Target {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float node_1853 = distance(float2(0.5,0.5),sceneUVs.rg);
                o.Emission = lerp(tex2D( _GrabTexture, sceneUVs.rg).rgb,(tex2D( _GrabTexture, (sceneUVs.rg+(float2(0.001,0.001)*_node_2174))).rgb+tex2D( _GrabTexture, (sceneUVs.rg+(_node_2174*float2(-0.001,-0.001)))).rgb),(node_1853*2.0+0.0));
                
                float3 diffColor = float3(0,0,0);
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
