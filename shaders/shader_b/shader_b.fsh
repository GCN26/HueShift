//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const vec3 replace_color = vec3(0,0.0,2);
uniform vec3 original_color;

void main()
{
    vec4 color = v_vColour * texture2D( gm_BaseTexture,v_vTexcoord );
	vec3 diff = color.rgb-original_color;
	float equality = float(dot(diff,diff) < 0.0001);
	color.rgb = mix( color.rgb, replace_color, 0.25);
	gl_FragColor = color;
}
