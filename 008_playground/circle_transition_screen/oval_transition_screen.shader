shader_type canvas_item;
render_mode unshaded;

uniform float circle_size: hint_range(0.0, 1.05);
uniform float screen_width: hint_range(800.0, 7680.0) = 800.0;
uniform float screen_height: hint_range(600.0, 4320.0) = 600.0;

void fragment() {
	if (distance(vec2(0.5, 0.5), UV) < circle_size) {
		COLOR.a = 0f;
	}
}
