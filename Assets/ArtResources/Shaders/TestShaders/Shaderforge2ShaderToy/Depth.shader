// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:6,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:False,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:32670,y:32866,varname:node_9361,prsc:2|custl-9198-OUT;n:type:ShaderForge.SFN_Tex2d,id:851,x:31959,y:32860,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:11e5aa6a9abe3e548ba05a3db33962c0,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:3812,x:31965,y:33260,ptovrint:False,ptlb:node_3812,ptin:_node_3812,varname:node_3812,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.9632353,c3:0.8970588,c4:1;n:type:ShaderForge.SFN_Fresnel,id:166,x:31965,y:33047,varname:node_166,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2692,x:32203,y:33047,varname:node_2692,prsc:2|A-166-OUT,B-1039-OUT,C-3812-RGB;n:type:ShaderForge.SFN_Vector1,id:1039,x:31965,y:33178,varname:node_1039,prsc:2,v1:2;n:type:ShaderForge.SFN_SceneDepth,id:9013,x:32182,y:32646,varname:node_9013,prsc:2;n:type:ShaderForge.SFN_Depth,id:3210,x:32182,y:32773,varname:node_3210,prsc:2;n:type:ShaderForge.SFN_If,id:9198,x:32427,y:32940,varname:node_9198,prsc:2|A-9013-OUT,B-3210-OUT,GT-851-RGB,EQ-851-RGB,LT-2692-OUT;proporder:851-3812;pass:END;sub:END;*/

Shader "Shader Forge/Depth" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _node_3812 ("node_3812", Color) = (0.5,0.9632353,0.8970588,1)
    }
    SubShader {
        Tags {
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float4 _node_3812;
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
                float4 projPos : TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
                float node_9198_if_leA = step(sceneZ,partZ);
                float node_9198_if_leB = step(partZ,sceneZ);
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 finalColor = lerp((node_9198_if_leA*((1.0-max(0,dot(normalDirection, viewDirection)))*2.0*_node_3812.rgb))+(node_9198_if_leB*_Diffuse_var.rgb),_Diffuse_var.rgb,node_9198_if_leA*node_9198_if_leB);
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
