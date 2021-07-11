shader_type canvas_item;

uniform float tiled_factor = 5.0;
uniform float aspect_ratio = 0.5;

uniform vec4 shadow_color: hint_color;

uniform float sine_time_factor = 0.03;
uniform vec2 sine_offset_scale = vec2(0.4, 0.4);
uniform float sine_wave_size = 0.4;

uniform float texture_offset_time_factor = 0.05;
uniform vec2 texture_offset_scale = vec2(0.2, 0.2);
uniform float texture_offset_wave_size = 0.1;
uniform sampler2D texture_offset_uv: hint_black;


vec2 calculate_sine_offset(in float time, float multiplier, vec2 uv, vec2 offset_scale) {
	float time_multiplied = time * multiplier;
	float unique_offset = uv.x + uv.y;
	return vec2(
		sin(time_multiplied + unique_offset * offset_scale.x),
		cos(time_multiplied + unique_offset * offset_scale.y)
	);
}


void fragment() {
	vec2 based_uv_offset = UV * texture_offset_scale;
	based_uv_offset += TIME * texture_offset_time_factor;
	
	vec2 adjusted_uv = UV * tiled_factor;
	adjusted_uv.y *= aspect_ratio;

	vec2 texture_based_offset = texture(texture_offset_uv, based_uv_offset).rg * 2.0 - 1.0;
	vec2 sine_offset = calculate_sine_offset(TIME, sine_time_factor, adjusted_uv, sine_offset_scale);
	
	vec2 waves_uvs = adjusted_uv + texture_based_offset * texture_offset_wave_size + sine_offset * sine_wave_size;

	float waves_height = (texture_based_offset.y * 0.5 + sine_offset.y) * 0.25 + 0.5;
	

	vec4 diffuse_color = texture(TEXTURE, waves_uvs);
	COLOR = mix(diffuse_color, shadow_color, waves_height);
	//	COLOR = vec4(water_height, water_height, water_height, 1.0); // visualize water height
	NORMALMAP = texture(NORMAL_TEXTURE, waves_uvs / 5.0).rgb;
}