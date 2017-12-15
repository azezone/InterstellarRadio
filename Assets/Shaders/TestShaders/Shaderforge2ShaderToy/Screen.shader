// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:1,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:6,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:1,qpre:4,rntp:5,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:2865,x:32632,y:33003,varname:node_2865,prsc:2|emission-6797-OUT,alpha-4911-OUT,voffset-9496-OUT;n:type:ShaderForge.SFN_TexCoord,id:6793,x:32114,y:33444,varname:node_6793,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:9496,x:32292,y:33444,varname:node_9496,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-6793-UVOUT;n:type:ShaderForge.SFN_Color,id:4354,x:31905,y:32850,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_4354,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_TexCoord,id:2881,x:30823,y:33084,varname:node_2881,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:1234,x:31162,y:33084,varname:node_1234,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-7281-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:5907,x:31328,y:33084,varname:node_5907,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-1234-OUT;n:type:ShaderForge.SFN_ArcTan2,id:7107,x:31502,y:33084,varname:node_7107,prsc:2,attp:2|A-5907-G,B-5907-R;n:type:ShaderForge.SFN_Tex2d,id:9118,x:31905,y:33084,ptovrint:False,ptlb:node_9118,ptin:_node_9118,varname:node_9118,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:18214e9d6af6248559d501391856f1c7,ntxv:2,isnm:False|UVIN-6328-OUT;n:type:ShaderForge.SFN_Append,id:6328,x:31679,y:33084,varname:node_6328,prsc:2|A-7107-OUT,B-7107-OUT;n:type:ShaderForge.SFN_Multiply,id:6797,x:32221,y:32967,varname:node_6797,prsc:2|A-9118-RGB,B-3298-OUT,C-4354-RGB;n:type:ShaderForge.SFN_TexCoord,id:2979,x:31032,y:33280,varname:node_2979,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector2,id:6567,x:31052,y:33429,varname:node_6567,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:1921,x:31255,y:33290,varname:node_1921,prsc:2|A-2979-UVOUT,B-6567-OUT;n:type:ShaderForge.SFN_Slider,id:1746,x:31395,y:33594,ptovrint:False,ptlb:round,ptin:_round,varname:node_1746,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8461539,max:1;n:type:ShaderForge.SFN_Exp,id:2200,x:31512,y:33412,varname:node_2200,prsc:2,et:0|IN-1746-OUT;n:type:ShaderForge.SFN_Power,id:1700,x:31512,y:33281,varname:node_1700,prsc:2|VAL-1921-OUT,EXP-2200-OUT;n:type:ShaderForge.SFN_RemapRange,id:6526,x:31713,y:33281,varname:node_6526,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.5|IN-1700-OUT;n:type:ShaderForge.SFN_Vector1,id:3298,x:31905,y:33002,varname:node_3298,prsc:2,v1:2;n:type:ShaderForge.SFN_Slider,id:9256,x:30688,y:33255,ptovrint:False,ptlb:speed,ptin:_speed,varname:node_9256,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:40,max:40;n:type:ShaderForge.SFN_Tex2dAsset,id:2333,x:32718,y:33095,ptovrint:False,ptlb:pubber_copy_copy,ptin:_pubber_copy_copy,varname:_pubber_copy_copy,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:11e5aa6a9abe3e548ba05a3db33962c0,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Rotator,id:7281,x:31009,y:33084,varname:node_7281,prsc:2|UVIN-2881-UVOUT,SPD-9256-OUT;n:type:ShaderForge.SFN_Multiply,id:9715,x:31905,y:33281,varname:node_9715,prsc:2|A-6526-OUT,B-2548-OUT;n:type:ShaderForge.SFN_RemapRange,id:4911,x:32114,y:33263,varname:node_4911,prsc:2,frmn:0,frmx:1,tomn:0,tomx:1|IN-9715-OUT;n:type:ShaderForge.SFN_Slider,id:2548,x:31662,y:33475,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_2548,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.623932,max:2;proporder:4354-9118-1746-9256-2548;pass:END;sub:END;*/

Shader "Shader Forge/Screen" {
    Properties {
        _Color ("Color", Color) = (1,0,0,1)
        _node_9118 ("node_9118", 2D) = "black" {}
        _round ("round", Range(0, 1)) = 0.8461539
        _speed ("speed", Range(0, 40)) = 40
        _alpha ("alpha", Range(0, 2)) = 1.623932
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Overlay+1"
            "RenderType"="Overlay"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _node_9118; uniform float4 _node_9118_ST;
            uniform float _round;
            uniform float _speed;
            uniform float _alpha;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                v.vertex.xyz = float3((o.uv0*2.0+-1.0),0.0);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = v.vertex;
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
////// Emissive:
                float4 node_8787 = _Time + _TimeEditor;
                float node_7281_ang = node_8787.g;
                float node_7281_spd = _speed;
                float node_7281_cos = cos(node_7281_spd*node_7281_ang);
                float node_7281_sin = sin(node_7281_spd*node_7281_ang);
                float2 node_7281_piv = float2(0.5,0.5);
                float2 node_7281 = (mul(i.uv0-node_7281_piv,float2x2( node_7281_cos, -node_7281_sin, node_7281_sin, node_7281_cos))+node_7281_piv);
                float2 node_5907 = (node_7281*2.0+-1.0).rg;
                float node_7107 = ((atan2(node_5907.g,node_5907.r)/6.28318530718)+0.5);
                float2 node_6328 = float2(node_7107,node_7107);
                float4 _node_9118_var = tex2D(_node_9118,TRANSFORM_TEX(node_6328, _node_9118));
                float3 emissive = (_node_9118_var.rgb*2.0*_Color.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,(((pow(distance(i.uv0,float2(0.5,0.5)),exp(_round))*0.5+0.0)*_alpha)*1.0+0.0));
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
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _node_9118; uniform float4 _node_9118_ST;
            uniform float _speed;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                v.vertex.xyz = float3((o.uv0*2.0+-1.0),0.0);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : SV_Target {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float4 node_3911 = _Time + _TimeEditor;
                float node_7281_ang = node_3911.g;
                float node_7281_spd = _speed;
                float node_7281_cos = cos(node_7281_spd*node_7281_ang);
                float node_7281_sin = sin(node_7281_spd*node_7281_ang);
                float2 node_7281_piv = float2(0.5,0.5);
                float2 node_7281 = (mul(i.uv0-node_7281_piv,float2x2( node_7281_cos, -node_7281_sin, node_7281_sin, node_7281_cos))+node_7281_piv);
                float2 node_5907 = (node_7281*2.0+-1.0).rg;
                float node_7107 = ((atan2(node_5907.g,node_5907.r)/6.28318530718)+0.5);
                float2 node_6328 = float2(node_7107,node_7107);
                float4 _node_9118_var = tex2D(_node_9118,TRANSFORM_TEX(node_6328, _node_9118));
                o.Emission = (_node_9118_var.rgb*2.0*_Color.rgb);
                
                float3 diffColor = float3(0,0,0);
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
