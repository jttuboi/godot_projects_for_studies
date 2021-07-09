shader_type canvas_item;

uniform float timeSin = 1.0f;
uniform float timeCos = 1.0f;
uniform float amplitudeX = 1.0f;
uniform float amplitudeY = 20.0f;

void vertex() {
	float vertPosX = cos(timeCos + VERTEX.x) * amplitudeX;
	float vertPosY = sin(timeSin + VERTEX.y + VERTEX.x) * amplitudeY;

	VERTEX.x = VERTEX.x + vertPosX;
	VERTEX.y = VERTEX.y + vertPosY;
}