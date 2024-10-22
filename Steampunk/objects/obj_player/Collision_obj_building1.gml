/// @description put player behind building
if ((x > other.x) and (y <= -.5 * (x - other.x) + other.y)) or
	((x <= other.x) and (y <= .5 * (x - other.x) + other.y)) {
	other.image_alpha = .6;
	depth = other.depth + 1;
	other.alarm[0] = 2;
	alarm[8] = 2;
	show_debug_message((x <= other.x) and (y <= .5 * (x - other.x) + other.y));
	show_debug_message(other.x);
	show_debug_message(other.y);
	show_debug_message(x);
	show_debug_message(y);
	show_debug_message("");
	show_debug_message("");
} else {
	other.image_alpha = 1;
	depth = 100;
}