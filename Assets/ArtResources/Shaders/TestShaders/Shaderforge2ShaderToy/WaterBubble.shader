// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:33319,y:32879,varname:node_2865,prsc:2|diff-9870-OUT,spec-358-OUT,gloss-1813-OUT,clip-6338-OUT,voffset-928-OUT;n:type:ShaderForge.SFN_Multiply,id:6343,x:31742,y:32673,varname:node_6343,prsc:2|A-7736-RGB,B-6665-RGB;n:type:ShaderForge.SFN_Color,id:6665,x:31549,y:32766,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:7736,x:31549,y:32579,ptovrint:True,ptlb:Base Color,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:11e5aa6a9abe3e548ba05a3db33962c0,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:358,x:32140,y:32796,ptovrint:False,ptlb:Metallic,ptin:_Metallic,varname:node_358,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:1813,x:32140,y:32913,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Metallic_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2222222,max:1;n:type:ShaderForge.SFN_NormalVector,id:748,x:30325,y:33590,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:8630,x:30247,y:33759,ptovrint:False,ptlb:node_8630,ptin:_node_8630,varname:node_8630,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6255707,max:1;n:type:ShaderForge.SFN_Multiply,id:2954,x:30672,y:33613,varname:node_2954,prsc:2|A-8081-R,B-748-OUT,C-8630-OUT;n:type:ShaderForge.SFN_Tex2d,id:8081,x:30471,y:33430,ptovrint:False,ptlb:node_8081,ptin:_node_8081,varname:node_8081,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:223ffa08b1d857f46bfb1ef8611b7bec,ntxv:0,isnm:False|UVIN-6925-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3379,x:30105,y:33430,varname:node_3379,prsc:2,uv:0;n:type:ShaderForge.SFN_Rotator,id:6925,x:30285,y:33430,varname:node_6925,prsc:2|UVIN-3379-UVOUT;n:type:ShaderForge.SFN_RemapRange,id:594,x:30862,y:33613,cmnt:vertex move,varname:node_594,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.2|IN-2954-OUT;n:type:ShaderForge.SFN_Fresnel,id:9220,x:31729,y:33041,varname:node_9220,prsc:2|EXP-8966-OUT;n:type:ShaderForge.SFN_Slider,id:8966,x:31360,y:33040,ptovrint:False,ptlb:node_8966,ptin:_node_8966,varname:node_8966,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Vector1,id:6709,x:31729,y:32936,varname:node_6709,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:6338,x:31946,y:33017,varname:node_6338,prsc:2|A-6709-OUT,B-9220-OUT;n:type:ShaderForge.SFN_Tex2d,id:4464,x:31899,y:32397,ptovrint:False,ptlb:node_8081_copy,ptin:_node_8081_copy,varname:_node_8081_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a1a169f1c3c647b49ab00087cb19c0f7,ntxv:0,isnm:False|UVIN-3264-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2023,x:31534,y:32397,varname:node_2023,prsc:2,uv:0;n:type:ShaderForge.SFN_Rotator,id:3264,x:31714,y:32397,varname:node_3264,prsc:2|UVIN-2023-UVOUT;n:type:ShaderForge.SFN_Lerp,id:7252,x:32140,y:32529,varname:node_7252,prsc:2|A-4464-R,B-6343-OUT,T-1640-OUT;n:type:ShaderForge.SFN_Slider,id:1640,x:31742,y:32838,ptovrint:False,ptlb:node_1640,ptin:_node_1640,varname:node_1640,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8340303,max:1;n:type:ShaderForge.SFN_Slider,id:4491,x:32140,y:32690,ptovrint:False,ptlb:node_4491,ptin:_node_4491,varname:node_4491,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.538462,max:3;n:type:ShaderForge.SFN_Multiply,id:9870,x:32484,y:32548,varname:node_9870,prsc:2|A-7252-OUT,B-4491-OUT;n:type:ShaderForge.SFN_Sin,id:2476,x:32035,y:33265,varname:node_2476,prsc:2|IN-5878-OUT;n:type:ShaderForge.SFN_Slider,id:2366,x:31503,y:33363,ptovrint:False,ptlb:node_2366,ptin:_node_2366,varname:node_2366,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:2;n:type:ShaderForge.SFN_Multiply,id:5878,x:31851,y:33265,varname:node_5878,prsc:2|A-2366-OUT,B-6506-T;n:type:ShaderForge.SFN_Time,id:6506,x:31606,y:33198,varname:node_6506,prsc:2;n:type:ShaderForge.SFN_Vector3,id:6678,x:32183,y:33160,varname:node_6678,prsc:2,v1:0,v2:1,v3:0;n:type:ShaderForge.SFN_If,id:4685,x:32103,y:33544,varname:node_4685,prsc:2|A-5532-V,B-8737-OUT,GT-9887-OUT,EQ-9887-OUT,LT-1412-OUT;n:type:ShaderForge.SFN_Vector1,id:8737,x:31851,y:33595,varname:node_8737,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:9887,x:31851,y:33651,varname:node_9887,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:1412,x:31851,y:33716,varname:node_1412,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:2511,x:32375,y:33272,varname:node_2511,prsc:2|A-2476-OUT,B-4685-OUT,C-6678-OUT;n:type:ShaderForge.SFN_TexCoord,id:5532,x:31851,y:33442,varname:node_5532,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:928,x:32738,y:33529,varname:node_928,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.01|IN-5547-OUT;n:type:ShaderForge.SFN_Sin,id:7594,x:32015,y:33849,varname:node_7594,prsc:2|IN-2085-OUT;n:type:ShaderForge.SFN_Slider,id:2003,x:31483,y:33947,ptovrint:False,ptlb:node_2366_copy,ptin:_node_2366_copy,varname:_node_2366_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:2;n:type:ShaderForge.SFN_Multiply,id:2085,x:31831,y:33849,varname:node_2085,prsc:2|A-2003-OUT,B-5560-T;n:type:ShaderForge.SFN_Time,id:5560,x:31586,y:33782,varname:node_5560,prsc:2;n:type:ShaderForge.SFN_Vector3,id:7128,x:32163,y:33744,varname:node_7128,prsc:2,v1:1,v2:0,v3:0;n:type:ShaderForge.SFN_If,id:454,x:32083,y:34128,varname:node_454,prsc:2|A-2278-U,B-9629-OUT,GT-4495-OUT,EQ-4495-OUT,LT-1528-OUT;n:type:ShaderForge.SFN_Vector1,id:9629,x:31831,y:34179,varname:node_9629,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:4495,x:31831,y:34235,varname:node_4495,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:1528,x:31831,y:34300,varname:node_1528,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:8440,x:32333,y:33896,varname:node_8440,prsc:2|A-7594-OUT,B-454-OUT,C-7128-OUT;n:type:ShaderForge.SFN_TexCoord,id:2278,x:31831,y:34026,varname:node_2278,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:5547,x:32579,y:33780,varname:node_5547,prsc:2|A-2511-OUT,B-8440-OUT;proporder:6665-7736-358-1813-8630-8081-8966-4464-1640-4491-2366-2003;pass:END;sub:END;*/

Shader "Shader Forge/WaterBubble" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Base Color", 2D) = "white" {}
        _Metallic ("Metallic", Range(0, 1)) = 0
        _Gloss ("Gloss", Range(0, 1)) = 0.2222222
        _node_8630 ("node_8630", Range(0, 1)) = 0.6255707
        _node_8081 ("node_8081", 2D) = "white" {}
        _node_8966 ("node_8966", Range(0, 1)) = 1
        _node_8081_copy ("node_8081_copy", 2D) = "white" {}
        _node_1640 ("node_1640", Range(0, 1)) = 0.8340303
        _node_4491 ("node_4491", Range(0, 3)) = 1.538462
        _node_2366 ("node_2366", Range(0, 2)) = 2
        _node_2366_copy ("node_2366_copy", Range(0, 2)) = 2
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Metallic;
            uniform float _Gloss;
            uniform float _node_8966;
            uniform sampler2D _node_8081_copy; uniform float4 _node_8081_copy_ST;
            uniform float _node_1640;
            uniform float _node_4491;
            uniform float _node_2366;
            uniform float _node_2366_copy;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_6506 = _Time + _TimeEditor;
                float node_4685_if_leA = step(o.uv0.g,0.5);
                float node_4685_if_leB = step(0.5,o.uv0.g);
                float node_9887 = 1.0;
                float4 node_5560 = _Time + _TimeEditor;
                float node_454_if_leA = step(o.uv0.r,0.5);
                float node_454_if_leB = step(0.5,o.uv0.r);
                float node_4495 = 1.0;
                v.vertex.xyz += (((sin((_node_2366*node_6506.g))*lerp((node_4685_if_leA*(-1.0))+(node_4685_if_leB*node_9887),node_9887,node_4685_if_leA*node_4685_if_leB)*float3(0,1,0))+(sin((_node_2366_copy*node_5560.g))*lerp((node_454_if_leA*(-1.0))+(node_454_if_leB*node_4495),node_4495,node_454_if_leA*node_454_if_leB)*float3(1,0,0)))*0.01+0.0);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                clip((1.0-pow(1.0-max(0,dot(normalDirection, viewDirection)),_node_8966)) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                d.boxMax[0] = unity_SpecCube0_BoxMax;
                d.boxMin[0] = unity_SpecCube0_BoxMin;
                d.probePosition[0] = unity_SpecCube0_ProbePosition;
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.boxMax[1] = unity_SpecCube1_BoxMax;
                d.boxMin[1] = unity_SpecCube1_BoxMin;
                d.probePosition[1] = unity_SpecCube1_ProbePosition;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 specularColor = _Metallic;
                float specularMonochrome;
                float4 node_1134 = _Time + _TimeEditor;
                float node_3264_ang = node_1134.g;
                float node_3264_spd = 1.0;
                float node_3264_cos = cos(node_3264_spd*node_3264_ang);
                float node_3264_sin = sin(node_3264_spd*node_3264_ang);
                float2 node_3264_piv = float2(0.5,0.5);
                float2 node_3264 = (mul(i.uv0-node_3264_piv,float2x2( node_3264_cos, -node_3264_sin, node_3264_sin, node_3264_cos))+node_3264_piv);
                float4 _node_8081_copy_var = tex2D(_node_8081_copy,TRANSFORM_TEX(node_3264, _node_8081_copy));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 diffuseColor = (lerp(float3(_node_8081_copy_var.r,_node_8081_copy_var.r,_node_8081_copy_var.r),(_MainTex_var.rgb*_Color.rgb),_node_1640)*_node_4491); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, GGXTerm(NdotH, 1.0-gloss));
                float specularPBL = (NdotL*visTerm*normTerm) * (UNITY_PI / 4);
                if (IsGammaSpace())
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                specularPBL = max(0, specularPBL * NdotL);
                float3 directSpecular = 1*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Metallic;
            uniform float _Gloss;
            uniform float _node_8966;
            uniform sampler2D _node_8081_copy; uniform float4 _node_8081_copy_ST;
            uniform float _node_1640;
            uniform float _node_4491;
            uniform float _node_2366;
            uniform float _node_2366_copy;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_6506 = _Time + _TimeEditor;
                float node_4685_if_leA = step(o.uv0.g,0.5);
                float node_4685_if_leB = step(0.5,o.uv0.g);
                float node_9887 = 1.0;
                float4 node_5560 = _Time + _TimeEditor;
                float node_454_if_leA = step(o.uv0.r,0.5);
                float node_454_if_leB = step(0.5,o.uv0.r);
                float node_4495 = 1.0;
                v.vertex.xyz += (((sin((_node_2366*node_6506.g))*lerp((node_4685_if_leA*(-1.0))+(node_4685_if_leB*node_9887),node_9887,node_4685_if_leA*node_4685_if_leB)*float3(0,1,0))+(sin((_node_2366_copy*node_5560.g))*lerp((node_454_if_leA*(-1.0))+(node_454_if_leB*node_4495),node_4495,node_454_if_leA*node_454_if_leB)*float3(1,0,0)))*0.01+0.0);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                clip((1.0-pow(1.0-max(0,dot(normalDirection, viewDirection)),_node_8966)) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 specularColor = _Metallic;
                float specularMonochrome;
                float4 node_5016 = _Time + _TimeEditor;
                float node_3264_ang = node_5016.g;
                float node_3264_spd = 1.0;
                float node_3264_cos = cos(node_3264_spd*node_3264_ang);
                float node_3264_sin = sin(node_3264_spd*node_3264_ang);
                float2 node_3264_piv = float2(0.5,0.5);
                float2 node_3264 = (mul(i.uv0-node_3264_piv,float2x2( node_3264_cos, -node_3264_sin, node_3264_sin, node_3264_cos))+node_3264_piv);
                float4 _node_8081_copy_var = tex2D(_node_8081_copy,TRANSFORM_TEX(node_3264, _node_8081_copy));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 diffuseColor = (lerp(float3(_node_8081_copy_var.r,_node_8081_copy_var.r,_node_8081_copy_var.r),(_MainTex_var.rgb*_Color.rgb),_node_1640)*_node_4491); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, GGXTerm(NdotH, 1.0-gloss));
                float specularPBL = (NdotL*visTerm*normTerm) * (UNITY_PI / 4);
                if (IsGammaSpace())
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                specularPBL = max(0, specularPBL * NdotL);
                float3 directSpecular = attenColor*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _node_8966;
            uniform float _node_2366;
            uniform float _node_2366_copy;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float2 uv1 : TEXCOORD2;
                float2 uv2 : TEXCOORD3;
                float4 posWorld : TEXCOORD4;
                float3 normalDir : TEXCOORD5;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_6506 = _Time + _TimeEditor;
                float node_4685_if_leA = step(o.uv0.g,0.5);
                float node_4685_if_leB = step(0.5,o.uv0.g);
                float node_9887 = 1.0;
                float4 node_5560 = _Time + _TimeEditor;
                float node_454_if_leA = step(o.uv0.r,0.5);
                float node_454_if_leB = step(0.5,o.uv0.r);
                float node_4495 = 1.0;
                v.vertex.xyz += (((sin((_node_2366*node_6506.g))*lerp((node_4685_if_leA*(-1.0))+(node_4685_if_leB*node_9887),node_9887,node_4685_if_leA*node_4685_if_leB)*float3(0,1,0))+(sin((_node_2366_copy*node_5560.g))*lerp((node_454_if_leA*(-1.0))+(node_454_if_leB*node_4495),node_4495,node_454_if_leA*node_454_if_leB)*float3(1,0,0)))*0.01+0.0);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                clip((1.0-pow(1.0-max(0,dot(normalDirection, viewDirection)),_node_8966)) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Metallic;
            uniform float _Gloss;
            uniform sampler2D _node_8081_copy; uniform float4 _node_8081_copy_ST;
            uniform float _node_1640;
            uniform float _node_4491;
            uniform float _node_2366;
            uniform float _node_2366_copy;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                float4 node_6506 = _Time + _TimeEditor;
                float node_4685_if_leA = step(o.uv0.g,0.5);
                float node_4685_if_leB = step(0.5,o.uv0.g);
                float node_9887 = 1.0;
                float4 node_5560 = _Time + _TimeEditor;
                float node_454_if_leA = step(o.uv0.r,0.5);
                float node_454_if_leB = step(0.5,o.uv0.r);
                float node_4495 = 1.0;
                v.vertex.xyz += (((sin((_node_2366*node_6506.g))*lerp((node_4685_if_leA*(-1.0))+(node_4685_if_leB*node_9887),node_9887,node_4685_if_leA*node_4685_if_leB)*float3(0,1,0))+(sin((_node_2366_copy*node_5560.g))*lerp((node_454_if_leA*(-1.0))+(node_454_if_leB*node_4495),node_4495,node_454_if_leA*node_454_if_leB)*float3(1,0,0)))*0.01+0.0);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = 0;
                
                float4 node_941 = _Time + _TimeEditor;
                float node_3264_ang = node_941.g;
                float node_3264_spd = 1.0;
                float node_3264_cos = cos(node_3264_spd*node_3264_ang);
                float node_3264_sin = sin(node_3264_spd*node_3264_ang);
                float2 node_3264_piv = float2(0.5,0.5);
                float2 node_3264 = (mul(i.uv0-node_3264_piv,float2x2( node_3264_cos, -node_3264_sin, node_3264_sin, node_3264_cos))+node_3264_piv);
                float4 _node_8081_copy_var = tex2D(_node_8081_copy,TRANSFORM_TEX(node_3264, _node_8081_copy));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 diffColor = (lerp(float3(_node_8081_copy_var.r,_node_8081_copy_var.r,_node_8081_copy_var.r),(_MainTex_var.rgb*_Color.rgb),_node_1640)*_node_4491);
                float specularMonochrome;
                float3 specColor;
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, _Metallic, specColor, specularMonochrome );
                float roughness = 1.0 - _Gloss;
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
