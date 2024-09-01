shader_type canvas_item;

// how many "square" of texture will be used to create the repeat pattern
uniform float tiled_factor = 5.0;

// aspect ratio is controlled by water.gd.
// when changes the size of sprite, automatically will update this var.
uniform float aspect_ratio = 0.5;

// controls the frequency of waves. if value is high, the speed of wave will be fast
uniform vec2 time_factor = vec2(1.0, 1.0);

// controls the distance between waves. if value is high, the distance is big
uniform vec2 offset_scale = vec2(2.0, 2.0);

// controls the size of wave. if value is high, the wave altitude effect will be high
uniform vec2 waves_size = vec2(0.05, 0.1);

void fragment() {
	// controls the quantity of repeat texture inside of sprite
	// the texture will change the size, but the pattern of texture will be the same
	vec2 tiled_uvs = UV * tiled_factor;
	tiled_uvs.y *= aspect_ratio;
	//COLOR = vec4(tiled_uvs, 0.0, 1.0);

//	// simulate the moving of water
//	// this only moves in the same coordination, don't make wave pattern
//	// change the position of color pixels using TIME
//	vec2 waves_uv_offset;
//	waves_uv_offset.x = cos(TIME) * 0.05;
//	waves_uv_offset.y = sin(TIME) * 0.05;

	// simulate the wave pattern
	vec2 waves_uv_offset;
	waves_uv_offset.x = cos(TIME * time_factor.x + (tiled_uvs.x + tiled_uvs.y) * offset_scale.x);
	waves_uv_offset.y = sin(TIME * time_factor.y + (tiled_uvs.x + tiled_uvs.y) * offset_scale.y);
	// shows the wave pattern without texture
	//COLOR = vec4(waves_uv_offset, 0.0, 1.0);

	COLOR = texture(TEXTURE, tiled_uvs + waves_uv_offset * waves_size);
}