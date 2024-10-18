/// @description draw pickup icon/button
draw_self();
if point_distance(x, y, obj_player.x, obj_player.y) <= pickup_distance {
	draw_set_color(c_grey);
	draw_rectangle(x-7, y-39, x+7, y-25, false);
	draw_set_color(c_white);
	draw_rectangle(x-7, y-39, x+7, y-25, true);
	draw_text(x-5, y-42, "E");
}