shader_type particles;

// TRANSFORM  [0] [1] [2] [3]
//         x | a   a   a   b |
//         y | a   a   a   b |
//         z | a   a   a   b |
//         w | c   c   c   c |
//
// a -> [0 or 1] rotation & scale
// b -> [-INF .. -INF] position
// c -> [0 or 1] irrelevant

float rand_from_seed(inout uint seed) {
	int k;
	int s = int(seed);
	if (s == 0)
	s = 305420679;
	k = s / 127773;
	s = 16807 * (s - k * 127773) - 2836 * k;
	if (s < 0)
		s += 2147483647;
	seed = uint(s);
	return float(seed % uint(65536)) / 65535.0;
}

void vertex() {
	uint seed = NUMBER + RANDOM_SEED;
	if (RESTART) {
		vec3 direction = vec3(rand_from_seed(seed) - 0.5, rand_from_seed(seed) - 0.5, 0);
		float speed = rand_from_seed(seed) * 500.0;
		VELOCITY = direction * speed;
	} else {
		VELOCITY.y += 2.0;
	}

//	// RESTART is only for init data
//	if (RESTART) {
//		VELOCITY.x = 100.0;
//	} else {
//		VELOCITY.y += 2.0; }
	
//	// invert the image in orientation y (in other words, the texture'll be upside down)
//	TRANSFORM[1].y = -1.0;
//
//	// when distance is more than 200 in x, the texture won't appear until reset.
//	// lifetime is set with 5 sec to test it
//	if (TRANSFORM[3].x > 200.0) { ACTIVE = false; }
//
//	// when distance is more than 200 in x, the texture stops
//	// lifetime is set with 5 sec to test it
	if (TRANSFORM[3].x > 200.0) { VELOCITY = vec3(0); }
	
	COLOR.a = max(COLOR.a - DELTA, 0.0);
}