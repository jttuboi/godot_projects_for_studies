shader_type canvas_item;

const float PI = 3.14159;

// scale of screen
uniform float scale_factor: hint_range(0.1, 2.0) = 1.0; // 2.0 is double zoom

// changes the figure ("vulto" em pt-BR) of the image in background
uniform float color_distortion_effect = 1.0;

// number of lines simulated
uniform float scanline_count: hint_range(0, 1080) = 50.0;


// generate curve effect of old convex tvs
vec2 _uv_curve(vec2 uv) { // UV came [0,1] values
	uv = (uv - 0.5) * 2.0; // convert UV to [-1,1] values
	
	// this gives the curve distortion, like as curve old tv. 
	float curve_x_factor = 8.0; // less value, more curve is added
	float curve_y_factor = 4.5; // less value, more curve is added

	// it's like cat eye effect. but it's used for simluate the curvature of tv.
	uv.x *= 1.0 + pow(abs(uv.y) / curve_x_factor, 2.0); // pow() helps to smooth the curvature
	uv.y *= 1.0 + pow(abs(uv.x) / curve_y_factor, 2.0);

	uv /= scale_factor;

	uv = (uv / 2.0) + 0.5; // go back to [0,1] values
	return uv;
}

void fragment() {
	// this gives the illusion of distortion and zoom the texture background
	float r = texture(SCREEN_TEXTURE, _uv_curve(SCREEN_UV) + vec2(SCREEN_PIXEL_SIZE.x * 0.0), 0.0).r;
	float g = texture(SCREEN_TEXTURE, _uv_curve(SCREEN_UV) + vec2(SCREEN_PIXEL_SIZE.x * color_distortion_effect), 0.0).g;
	float b = texture(SCREEN_TEXTURE, _uv_curve(SCREEN_UV) + vec2(SCREEN_PIXEL_SIZE.x * -color_distortion_effect), 0.0).b;

	// this show the scanlines effect of tv
	float s = sin(_uv_curve(SCREEN_UV).y * scanline_count * PI * 2.0);
	s = (s * 0.5 + 0.5) * 0.9 + 0.1;
	vec4 scanline = vec4(vec3(pow(s, 0.25)), 1.0);

	COLOR = vec4(r, g, b, 1.0) * scanline;
}