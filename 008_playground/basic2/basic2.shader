shader_type canvas_item;

uniform float size = 1.0;


// CONTROLS THE VERTICES OF TEXTURE
void vertex() {
//	// move all vertices to 10 pixels to right
//	VERTEX += vec2(10.0, 0.0);
//
//	// animate Sprite moving in big circle around its location
//	VERTEX += vec2(cos(TIME)*100.0, sin(TIME)*100.0);
}

// CONTROLS THE COLORS OF PIXELS OF TEXTURE
void fragment() {
//	// all pixels will have the same color
//	COLOR = vec4(0.4, 0.6, 0.9, 1.0);
//
//	// UV
//	// TOP-LFT (0,0)   TOP-RGT (1,0)
//	// BTM-LFT (0,1)   BTM-RGT (1,1)
//
//	// give a mix color based on UV
//	COLOR = vec4(UV, 0.5, 1.0);
//
//	// can access only one color channel
//	COLOR.b = 0.0;
//	COLOR.r = 0.5;
//
//	// TEXTURE give the color of pixels of texture is set on Node (Sprite this example)
//
//	// can give a color for texture
//	COLOR = texture(TEXTURE, UV); //read from texture
//	COLOR.b = 1.0; //set blue channel to 1.0
}

// CONSTROLS THE LIGHT OF PIXELS OF TEXTURE
void light() {
	
}
// OBS:
// The light() function won't be run if the vertex_lighting render mode is enabled,
// or if Rendering > Quality > Shading > Force Vertex Shading is enabled in the Project Settings.
// (It's enabled by default on mobile platforms.)