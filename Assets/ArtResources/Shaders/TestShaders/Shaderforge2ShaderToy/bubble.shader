// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33152,y:32317,varname:node_3138,prsc:2|emission-6894-OUT;n:type:ShaderForge.SFN_TexCoord,id:7802,x:31719,y:32599,varname:node_7802,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:9213,x:32518,y:32674,ptovrint:False,ptlb:node_5664,ptin:_node_5664,varname:node_9213,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6743f9c187cf1db4f84c7a4004a75829,ntxv:0,isnm:False|UVIN-1497-OUT;n:type:ShaderForge.SFN_Panner,id:3927,x:31935,y:32599,varname:node_3927,prsc:2,spu:0,spv:-0.8|UVIN-7802-UVOUT;n:type:ShaderForge.SFN_Color,id:9567,x:32382,y:32303,ptovrint:False,ptlb:backcolor,ptin:_backcolor,varname:node_9567,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4448276,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:5883,x:32613,y:32303,varname:node_5883,prsc:2|A-9567-RGB,B-9335-OUT;n:type:ShaderForge.SFN_Slider,id:9335,x:32272,y:32501,ptovrint:False,ptlb:node_9335,ptin:_node_9335,varname:node_9335,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:9175,x:32884,y:32629,varname:node_9175,prsc:2|A-8015-OUT,B-9213-RGB;n:type:ShaderForge.SFN_Multiply,id:6894,x:32910,y:32404,varname:node_6894,prsc:2|A-5883-OUT,B-9175-OUT;n:type:ShaderForge.SFN_Vector1,id:8015,x:32613,y:32586,varname:node_8015,prsc:2,v1:1.5;n:type:ShaderForge.SFN_ValueProperty,id:199,x:31614,y:32787,ptovrint:False,ptlb:repeat_x,ptin:_repeat_x,varname:node_199,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:1497,x:32192,y:32717,varname:node_1497,prsc:2|A-3927-UVOUT,B-1976-OUT;n:type:ShaderForge.SFN_Vector2,id:5549,x:31614,y:32873,varname:node_5549,prsc:2,v1:1,v2:0;n:type:ShaderForge.SFN_Multiply,id:252,x:31819,y:32817,varname:node_252,prsc:2|A-199-OUT,B-5549-OUT;n:type:ShaderForge.SFN_Vector2,id:1460,x:31614,y:33098,varname:node_1460,prsc:2,v1:0,v2:1;n:type:ShaderForge.SFN_ValueProperty,id:9636,x:31614,y:33008,ptovrint:False,ptlb:repeat_y,ptin:_repeat_y,varname:_node_199_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:5041,x:31819,y:33036,varname:node_5041,prsc:2|A-9636-OUT,B-1460-OUT;n:type:ShaderForge.SFN_Add,id:1976,x:32010,y:32922,varname:node_1976,prsc:2|A-252-OUT,B-5041-OUT;proporder:9567-9335-199-9636-9213;pass:END;sub:END;*/

Shader "Shader Forge/bubble" {
    Properties {
        _backcolor ("backcolor", Color) = (0.4448276,1,1,1)
        _node_9335 ("node_9335", Range(0, 1)) = 1
        _repeat_x ("repeat_x", Float ) = 2
        _repeat_y ("repeat_y", Float ) = 1
        _node_5664 ("node_5664", 2D) = "white" {}
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
            uniform float4 _TimeEditor;
            uniform sampler2D _node_5664; uniform float4 _node_5664_ST;
            uniform float4 _backcolor;
            uniform float _node_9335;
            uniform float _repeat_x;
            uniform float _repeat_y;
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
                float4 node_357 = _Time + _TimeEditor;
                float2 node_1497 = ((i.uv0+node_357.g*float2(0,-0.8))*((_repeat_x*float2(1,0))+(_repeat_y*float2(0,1))));
                float4 _node_5664_var = tex2D(_node_5664,TRANSFORM_TEX(node_1497, _node_5664));
                float3 emissive = ((_backcolor.rgb*_node_9335)*(1.5*_node_5664_var.rgb));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
