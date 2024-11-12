shader_type canvas_item;
uniform sampler2D input_texture;
uniform float lod: hint_range(0.0, 50) = 0;
uniform vec2 blur_radius = vec2(12.0, 12.0);

// Hash function to create a pseudo-random value
float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

void fragment() {
    vec2 uv = SCREEN_UV;
    vec4 color = vec4(0.0);
    vec2 offset = blur_radius * SCREEN_PIXEL_SIZE;

    // Create static I guess
    float random_offset = random(FRAGCOORD.xy + TIME * 5.0) * 10.0;
    float moving_y = mod(FRAGCOORD.y + random_offset, 10.0);
    if (moving_y < 3.0) {
        color = vec4(0.0, 0.8, 0.0, 1.0);
    } else if (moving_y == 1.0 || moving_y == 9.0) {
        color *= 0.5; // Tint lines on either side darker
    }

    //add scan lines
    float moving_y2 = mod(FRAGCOORD.y, 10.0);
    if (int(moving_y2) < 3) {
    	color = vec4(0.0, 0.8, 0.0, 1.0);
    } else if (int(moving_y2) == 1 || int(moving_y2) == 9) {
    	color *= 0.5; // Tint the lines on either side darker
    }



    // Sample neighboring pixels
    color += texture(input_texture, uv + vec2(-offset.x, -offset.y), lod);
    color += texture(input_texture, uv + vec2(0.0, -offset.y), lod);
    color += texture(input_texture, uv + vec2(offset.x, -offset.y), lod);
    color += texture(input_texture, uv + vec2(-offset.x, 0.0), lod);
    color += texture(input_texture, uv, lod);
    color += texture(input_texture, uv + vec2(offset.x, 0.0), lod);
    color += texture(input_texture, uv + vec2(-offset.x, offset.y), lod);
    color += texture(input_texture, uv + vec2(0.0, offset.y), lod);
    color += texture(input_texture, uv + vec2(offset.x, offset.y), lod);

    // Average the color
    color /= 9.0;

    // Tint everything green
    color += vec4(0.0, 0.4, 0.0, -0.8);

    // Get progressively darker as the distance gets further
    float fade = 1.0 - (distance(vec2(576.0, 324.0), FRAGCOORD.xy) / 700.0);
    color *= fade;

    COLOR = color;
}
