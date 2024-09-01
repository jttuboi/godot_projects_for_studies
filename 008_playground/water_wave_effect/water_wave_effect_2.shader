shader_type canvas_item;

uniform float tiled_factor = 10.0;
uniform float aspect_ratio = 0.5;

uniform float time_factor = 0.05;

uniform sampler2D uv_offset_texture: hint_black;
uniform vec2 uv_offset_scale = vec2(1.0, 1.0);

uniform vec2 waves_size = vec2(0.1, 0.1);

void fragment() {
	vec2 based_uv_offset = UV * uv_offset_scale; // determine teh UV that we use to look up our DuDv
	based_uv_offset += TIME * time_factor; // pan or scroll the texture over time
	
	// get the red and green channel of offset texture
	vec2 texture_based_offset = texture(uv_offset_texture, based_uv_offset).rg;
	// convert the values from [0..1] to [-1..1]
	texture_based_offset = texture_based_offset * 2.0 - 1.0;
	texture_based_offset *= waves_size;

//	// shows texture_based_offset pattern
//	COLOR = vec4(texture_based_offset, vec2(0.0, 1.0));

	// look at water_wave_effect.shader
	vec2 adjusted_uvs = UV * tiled_factor;
	adjusted_uvs.y *= aspect_ratio;

	COLOR = texture(TEXTURE, adjusted_uvs + texture_based_offset);
}