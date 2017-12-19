// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:33191,y:32868,varname:node_9361,prsc:2|alpha-9169-OUT,refract-2769-OUT;n:type:ShaderForge.SFN_Tex2d,id:2652,x:32290,y:32965,ptovrint:False,ptlb:node_2652,ptin:_node_2652,varname:node_2652,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d23513a7378639b42a384e54280f168f,ntxv:2,isnm:False;n:type:ShaderForge.SFN_ComponentMask,id:1176,x:32546,y:32919,varname:node_1176,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2652-RGB;n:type:ShaderForge.SFN_Append,id:3009,x:32742,y:32939,varname:node_3009,prsc:2|A-1176-R,B-1176-G;n:type:ShaderForge.SFN_Slider,id:9196,x:32460,y:33227,ptovrint:False,ptlb:node_9196,ptin:_node_9196,varname:node_9196,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8376069,max:2;n:type:ShaderForge.SFN_Multiply,id:2769,x:32943,y:33109,varname:node_2769,prsc:2|A-3009-OUT,B-2652-A,C-9196-OUT,D-2294-A;n:type:ShaderForge.SFN_Vector1,id:9169,x:32943,y:32953,varname:node_9169,prsc:2,v1:0;n:type:ShaderForge.SFN_VertexColor,id:2294,x:32742,y:32784,varname:node_2294,prsc:2;proporder:2652-9196;pass:END;sub:END;*/

Shader "Shader Forge/shockWave" {
    Properties {
        _node_2652 ("node_2652", 2D) = "black" {}
        _node_9196 ("node_9196", Range(0, 2)) = 0.8376069
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
            uniform sampler2D _GrabTexture;
            uniform sampler2D _node_2652; uniform float4 _node_2652_ST;
            uniform float _node_9196;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 screenPos : TEXCOORD1;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
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
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float4 _node_2652_var = tex2D(_node_2652,TRANSFORM_TEX(i.uv0, _node_2652));
                float2 node_1176 = _node_2652_var.rgb.rg;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (float2(node_1176.r,node_1176.g)*_node_2652_var.a*_node_9196*i.vertexColor.a);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float3 finalColor = 0;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,0.0),1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
