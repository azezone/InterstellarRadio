// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33870,y:32019,varname:node_3138,prsc:2|emission-8232-OUT,clip-708-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:33434,y:32139,ptovrint:False,ptlb:BackGround,ptin:_BackGround,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.9926471,c3:1,c4:0;n:type:ShaderForge.SFN_TexCoord,id:3727,x:30760,y:32231,varname:node_3727,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector2,id:1170,x:31597,y:32266,varname:node_1170,prsc:2,v1:0,v2:0.05;n:type:ShaderForge.SFN_Distance,id:2696,x:32036,y:32080,cmnt:r,varname:node_2696,prsc:2|A-1170-OUT,B-6347-OUT;n:type:ShaderForge.SFN_Subtract,id:9410,x:33085,y:32589,varname:node_9410,prsc:2|A-8821-OUT,B-2696-OUT;n:type:ShaderForge.SFN_Lerp,id:8232,x:33681,y:32036,varname:node_8232,prsc:2|A-7241-RGB,B-6852-OUT,T-1020-OUT;n:type:ShaderForge.SFN_Code,id:8821,x:32711,y:32683,varname:node_8821,prsc:2,code:ZgBsAG8AYQB0ACAAZAAgAD0AIAAoADEAMwAuADAAKgBoACAALQAgADIAMgAuADAAKgBoACoAaAAgACsAIAAxADAALgAwACoAaAAqAGgAKgBoACkALwAoADYALgAwAC0ANQAuADAAKgBoACkAOwAKAHIAZQB0AHUAcgBuACAAZAA7AA==,output:0,fname:d,width:247,height:112,input:0,input_1_label:h|A-7246-OUT;n:type:ShaderForge.SFN_Abs,id:7246,x:32519,y:32527,cmnt:h,varname:node_7246,prsc:2|IN-408-OUT;n:type:ShaderForge.SFN_ArcTan2,id:2218,x:32169,y:32457,varname:node_2218,prsc:2,attp:0|A-3315-R,B-3315-G;n:type:ShaderForge.SFN_RemapRange,id:6528,x:31031,y:32228,varname:node_6528,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-3727-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:3315,x:31999,y:32506,varname:node_3315,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-6347-OUT;n:type:ShaderForge.SFN_Divide,id:408,x:32350,y:32527,varname:node_408,prsc:2|A-2218-OUT,B-2483-OUT;n:type:ShaderForge.SFN_Pi,id:2483,x:32185,y:32616,varname:node_2483,prsc:2;n:type:ShaderForge.SFN_Subtract,id:6347,x:31804,y:32309,varname:node_6347,prsc:2|A-1334-OUT,B-1170-OUT;n:type:ShaderForge.SFN_Tex2d,id:2247,x:32874,y:32426,ptovrint:False,ptlb:MainImage,ptin:_MainImage,varname:node_2247,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:857a8e9195b715848abbbbb790d378b1,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Lerp,id:708,x:33681,y:32281,varname:node_708,prsc:2|A-7241-A,B-840-A,T-1020-OUT;n:type:ShaderForge.SFN_Time,id:5863,x:30760,y:32432,varname:node_5863,prsc:2;n:type:ShaderForge.SFN_Code,id:1553,x:31038,y:32504,varname:node_1553,prsc:2,code:ZgBsAG8AYQB0ACAAdAB0ACAAPQAgAGYAbQBvAGQAKABpAEcAbABvAGIAYQBsAFQAaQBtAGUALAAxAC4ANQApAC8AMQAuADUAOwAgACAACgB0AHQAIAA9ACAAZgBtAG8AZAAoAGkARwBsAG8AYgBhAGwAVABpAG0AZQAsAF8ARAB1AHIAYQB0AGkAbwBuACkALwBfAEQAdQByAGEAdABpAG8AbgA7ACAAIAAKAGYAbABvAGEAdAAgAHMAcwAgAD0AIABwAG8AdwAoAHQAdAAsAC4AMgApACoAMAAuADUAIAArACAAMAAuADUAOwAgACAACgBzAHMAIAA9ACAAMQAuADAAIAArACAAcwBzACoAMAAuADUAKgBzAGkAbgAoAHQAdAAqADYALgAyADgAMwAxACoAMwAuADAAIAArACAAcAAuAHkAKgAwAC4ANQApACoAZQB4AHAAKAAtAHQAdAAqADQALgAwACkAOwAgACAACgBwACAAKgA9ACAAZgBsAG8AYQB0ADIAKAAwAC4ANQAsADEALgA1ACkAIAArACAAcwBzACoAZgBsAG8AYQB0ADIAKAAwAC4ANQAsAC0AMAAuADUAKQA7AAoAcgBlAHQAdQByAG4AIABwADsA,output:1,fname:animation,width:247,height:116,input:1,input:0,input:0,input_1_label:p,input_2_label:iGlobalTime,input_3_label:_Duration|A-6528-OUT,B-5863-T,C-2558-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2558,x:30760,y:32642,ptovrint:False,ptlb:duration,ptin:_duration,varname:node_2558,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:6338,x:31395,y:32555,ptovrint:False,ptlb:isAnimation,ptin:_isAnimation,varname:node_6338,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-8264-OUT,B-8133-OUT;n:type:ShaderForge.SFN_Vector1,id:6895,x:31395,y:32687,varname:node_6895,prsc:2,v1:0.5;n:type:ShaderForge.SFN_If,id:1334,x:31597,y:32376,varname:node_1334,prsc:2|A-6338-OUT,B-6895-OUT,GT-1553-OUT,EQ-1553-OUT,LT-6528-OUT;n:type:ShaderForge.SFN_Vector1,id:8264,x:31123,y:32698,varname:node_8264,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:8133,x:31123,y:32639,varname:node_8133,prsc:2,v1:1;n:type:ShaderForge.SFN_Color,id:840,x:32864,y:32216,ptovrint:False,ptlb:heartColor,ptin:_heartColor,varname:node_840,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Code,id:6852,x:33170,y:31961,varname:node_6852,prsc:2,code:ZgBsAG8AYQB0ACAAcwAgAD0AIAAxAC4AMAAtADAALgA1ACoAYwBsAGEAbQBwACgAcgAvAGQALAAwAC4AMAAsADEALgAwACkAOwAgACAACgBzACAAPQAgADAALgA3ADUAIAArACAAMAAuADcANQAqAHgAOwAgACAACgBzACAAKgA9ACAAMQAuADAALQAwAC4AMgA1ACoAcgA7ACAAIAAKAHMAIAA9ACAAMAAuADUAIAArACAAMAAuADYAKgBzADsAIAAgAAoAcwAgACoAPQAgADAALgA1ACsAMAAuADUAKgBwAG8AdwAoACAAMQAuADAALQBjAGwAYQBtAHAAKAByAC8AZAAsACAAMAAuADAALAAgADEALgAwACAAKQAsACAAMAAuADEAIAApADsAIAAgAAoAZgBsAG8AYQB0ADMAIABoAGMAbwBsACAAPQAgAGYAbABvAGEAdAAzACgAMQAuADAALAAwAC4ANQAqAHIALAAwAC4AMwApACoAcwA7ACAAIAAKAGgAYwBvAGwAIAA9ACAAXwBIAGUAYQByAHQAQwBvAGwAbwByACAAKgBzADsAIAAKAHIAZQB0AHUAcgBuACAAaABjAG8AbAA7AA==,output:2,fname:blendColor,width:247,height:128,input:2,input:0,input:0,input:0,input_1_label:_HeartColor,input_2_label:r,input_3_label:d,input_4_label:x|A-840-RGB,B-2696-OUT,C-8821-OUT,D-3315-G;n:type:ShaderForge.SFN_Smoothstep,id:1020,x:33489,y:32558,varname:node_1020,prsc:2|A-6449-OUT,B-3070-OUT,V-9410-OUT;n:type:ShaderForge.SFN_Multiply,id:6449,x:33194,y:32741,varname:node_6449,prsc:2|A-8633-OUT,B-7009-OUT;n:type:ShaderForge.SFN_Vector1,id:8633,x:33007,y:32754,varname:node_8633,prsc:2,v1:-1;n:type:ShaderForge.SFN_Vector1,id:2897,x:33002,y:32951,varname:node_2897,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:3070,x:33194,y:32929,varname:node_3070,prsc:2|A-7009-OUT,B-2897-OUT;n:type:ShaderForge.SFN_Slider,id:7009,x:32845,y:32849,ptovrint:False,ptlb:Blur,ptin:_Blur,varname:node_7009,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.09499783,max:1;n:type:ShaderForge.SFN_Vector1,id:5306,x:32915,y:31703,varname:node_5306,prsc:2,v1:-1;proporder:2247-7241-840-2558-6338-7009;pass:END;sub:END;*/

Shader "Shader Forge/Heart" {
    Properties {
        _MainImage ("MainImage", 2D) = "black" {}
        _BackGround ("BackGround", Color) = (1,0.9926471,1,0)
        _heartColor ("heartColor", Color) = (1,0,0,1)
        _duration ("duration", Float ) = 1
        [MaterialToggle] _isAnimation ("isAnimation", Float ) = 1
        _Blur ("Blur", Range(0, 1)) = 0.09499783
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
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers d3d9 opengl metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _BackGround;
            float d( float h ){
            float d = (13.0*h - 22.0*h*h + 10.0*h*h*h)/(6.0-5.0*h);
            return d;
            }
            
            float2 animation( float2 p , float iGlobalTime , float _Duration ){
            float tt = fmod(iGlobalTime,1.5)/1.5;  
            tt = fmod(iGlobalTime,_Duration)/_Duration;  
            float ss = pow(tt,.2)*0.5 + 0.5;  
            ss = 1.0 + ss*0.5*sin(tt*6.2831*3.0 + p.y*0.5)*exp(-tt*4.0);  
            p *= float2(0.5,1.5) + ss*float2(0.5,-0.5);
            return p;
            }
            
            uniform float _duration;
            uniform fixed _isAnimation;
            uniform float4 _heartColor;
            float3 blendColor( float3 _HeartColor , float r , float d , float x ){
            float s = 1.0-0.5*clamp(r/d,0.0,1.0);  
            s = 0.75 + 0.75*x;  
            s *= 1.0-0.25*r;  
            s = 0.5 + 0.6*s;  
            s *= 0.5+0.5*pow( 1.0-clamp(r/d, 0.0, 1.0 ), 0.1 );  
            float3 hcol = float3(1.0,0.5*r,0.3)*s;  
            hcol = _HeartColor *s; 
            return hcol;
            }
            
            uniform float _Blur;
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
                float node_1334_if_leA = step(lerp( 0.0, 1.0, _isAnimation ),0.5);
                float node_1334_if_leB = step(0.5,lerp( 0.0, 1.0, _isAnimation ));
                float2 node_6528 = (i.uv0*2.0+-1.0);
                float4 node_5863 = _Time + _TimeEditor;
                float2 node_1553 = animation( node_6528 , node_5863.g , _duration );
                float2 node_1170 = float2(0,0.05);
                float2 node_6347 = (lerp((node_1334_if_leA*node_6528)+(node_1334_if_leB*node_1553),node_1553,node_1334_if_leA*node_1334_if_leB)-node_1170);
                float2 node_3315 = node_6347.rg;
                float node_8821 = d( abs((atan2(node_3315.r,node_3315.g)/3.141592654)) );
                float node_2696 = distance(node_1170,node_6347); // r
                float node_1020 = smoothstep( ((-1.0)*_Blur), (_Blur*1.0), (node_8821-node_2696) );
                clip(lerp(_BackGround.a,_heartColor.a,node_1020) - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = lerp(_BackGround.rgb,blendColor( _heartColor.rgb , node_2696 , node_8821 , node_3315.g ),node_1020);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
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
            #pragma exclude_renderers d3d9 opengl metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _BackGround;
            float d( float h ){
            float d = (13.0*h - 22.0*h*h + 10.0*h*h*h)/(6.0-5.0*h);
            return d;
            }
            
            float2 animation( float2 p , float iGlobalTime , float _Duration ){
            float tt = fmod(iGlobalTime,1.5)/1.5;  
            tt = fmod(iGlobalTime,_Duration)/_Duration;  
            float ss = pow(tt,.2)*0.5 + 0.5;  
            ss = 1.0 + ss*0.5*sin(tt*6.2831*3.0 + p.y*0.5)*exp(-tt*4.0);  
            p *= float2(0.5,1.5) + ss*float2(0.5,-0.5);
            return p;
            }
            
            uniform float _duration;
            uniform fixed _isAnimation;
            uniform float4 _heartColor;
            uniform float _Blur;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float node_1334_if_leA = step(lerp( 0.0, 1.0, _isAnimation ),0.5);
                float node_1334_if_leB = step(0.5,lerp( 0.0, 1.0, _isAnimation ));
                float2 node_6528 = (i.uv0*2.0+-1.0);
                float4 node_5863 = _Time + _TimeEditor;
                float2 node_1553 = animation( node_6528 , node_5863.g , _duration );
                float2 node_1170 = float2(0,0.05);
                float2 node_6347 = (lerp((node_1334_if_leA*node_6528)+(node_1334_if_leB*node_1553),node_1553,node_1334_if_leA*node_1334_if_leB)-node_1170);
                float2 node_3315 = node_6347.rg;
                float node_8821 = d( abs((atan2(node_3315.r,node_3315.g)/3.141592654)) );
                float node_2696 = distance(node_1170,node_6347); // r
                float node_1020 = smoothstep( ((-1.0)*_Blur), (_Blur*1.0), (node_8821-node_2696) );
                clip(lerp(_BackGround.a,_heartColor.a,node_1020) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
