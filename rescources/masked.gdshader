shader_type canvas_item;

uniform vec2 mask_offset = vec2(0,0);
uniform bool enabled = true;

void fragment() {
	float a = 500.0;
	float d = distance(mask_offset, FRAGCOORD.xy);
	float masked = min(3.0 - (a / d), 1);

	vec4 orig_color = texture(TEXTURE, UV);
	float alpha = orig_color.a * masked;
	if (enabled) {
		COLOR.a = alpha;
	}
	COLOR.rgb = orig_color.rgb;
}
