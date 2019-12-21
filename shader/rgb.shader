shader_type spatial;

uniform float grid_size = 16.0;
varying vec3 vert;

void vertex() {
	vert = VERTEX;
}

void fragment() {
	vec2 grid = fract(vert.xz / grid_size);
	if (grid.x < 0.5 && grid.y < 0.5 || grid.x > 0.5 && grid.y > 0.5) {
		ALBEDO = vec3(0.0);
	}
	else {
		ALBEDO = vec3(1.0);
	}
}