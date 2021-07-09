shader_type canvas_item;

// THE VARIABLE IS SHOWING ON INSPECTOR OF PROPERTIES OF SHADER IN shader_param
uniform float distanceBetween;
// THE HINT_RANGE GIVES LIMIT FOR VARIABLE
uniform float radius: hint_range(0, 1);

// FRAGMENT AFFECT THE COLOR OF PIXELS
void fragment() {
//	//    R    G    B    A   -> COLOR
//	vec4(1.0, 0.0, 0.0, 1.0);
	
//	// ALL PIXELS OF SPRITE WILL SET TO RED COLOR
//	COLOR = vec4(1.0, 0.0, 0.0, 1.0); // red color
	
//	// UV ARE PIXELS COORDINATES NORMALIZED WITH VALUES (0,0) TOP-LEFT AND (1,1) BOTTOM-RIGHT
//	// UV.x IN LEFT SIDE is = 0, SO COLOR IS vec4(0.0, 0.0, 0.0, 1.0)
//	// UV.x IN RIGHT SIDE is = 1, SO COLOR IS vec4(1.0, 0.0, 0.0, 1.0)
//	COLOR = vec4(UV.x, 0.0, 0.0, 1.0);
	
//	// UV.x IN LEFT SIDE is = 0, SO COLOR IS vec4(0.0, 0.0, 0.0, 1.0) BLACK
//	// UV.x IN RIGHT SIDE is = 1, SO COLOR IS vec4(1.0, 0.0, 0.0, 1.0) RED
//	// (1.0 - UV.y) IN TOP SIDE is = 1, SO COLOR IS vec4(0.0, 1.0, 0.0, 1.0) GREEN
//	// (1.0 - UV.y) IN BOTTOM SIDE is = 0, SO COLOR IS vec4(0.0, 0.0, 0.0, 1.0) BLACK
//	// (1.0 - UV.y) IN TOP SIDE is = 1, SO COLOR IS vec4(0.0, 0.0, 0.5, 1.0) DARK BLUE
//	// MIXING THESE COLORS, WILL RESULT COLORED RECTANGLE
//	COLOR = vec4(UV.x, 1.0 - UV.y, 0.5, 1.0);
	
//	// TEXTURE GETS THE PIXELS OF SPRITE TEXTURE AND ADD THE COLOR BASED ON UV COORDINATES
//	// ONE CHANNEL OF COLOR CAN BE MODIFY DIRECTLY
//	COLOR = texture(TEXTURE, UV);
//	COLOR.a = 1.0 - UV.y;

//	// TIME IS A FLOAT CHANGING IN SECONDS
//	COLOR = texture(TEXTURE, UV);
//	COLOR.a = abs(sin(TIME * 0.5)); // IT'S USING SIN() TO CONTROL THE FADE EFFECT
//	COLOR.a = max(0.0, UV.x - abs(sin(TIME))); // MAX IS USED TO ALWAYS BE POSITIVE and UV.x - abs(sin(TIME)) CONTROLS THE FADE EFFECT BY LEFT

//	// GREYSCALE
//	COLOR = texture(TEXTURE, UV);
//	float avg = (COLOR.r + COLOR.g + COLOR.b) / 3.0;
//	COLOR.rgb = vec3(avg);
}

// VERTEX CONTROLS ALL VERTEX OF TEXTURE
// IT ALLOWS TO DEFORM AND SCALE THE TEXTURE
// THE VALUE OF FOUR CORNERS OF TEXTURE
// TOP-LFT (0, 0)   TOP-RGT (1, 0)
// BTM-LFT (0, 1)   BTM-RGT (1, 1)
void vertex() {
//	// THE LEFT POSITIONS ARE 0 (UX.x * 10 -> 0 * 10 = 0)
//	// THE RIGHT POSITIONS ARE 10 (UX.x * 10 -> 1 * 10 = 10)
//	// SO THE RESULT IS THE TEXTURE STRETCHED 10 PIXELS TO THE RIGHT
//	VERTEX.x += UV.x * 10.0;

//	// THE Y COORDINATES IS TOP OR BOTTOM, SO THE TIME AND SIN() CAN GIVE THE EFFECT OF MOVEMENT
//	// THE UV.x GIVES THE 0 VALUE TO VERTEX.y AND LEFT DON'T MOVE
//	// THE UX.y GIVES VALUES BETWEEN -1 .. 1 AND MULTIPLY TO 10 MOVES THE RIGHT UP AND DOWN
//	VERTEX.y += sin(UV.x * TIME) * 10.0;
}