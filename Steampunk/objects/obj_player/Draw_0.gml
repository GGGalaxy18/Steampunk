/// @description draw filtered sprite
//shader_set(sh_shader);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, blend, image_alpha);
//shader_reset();

// bullet count
var _show_bullets = true;
if current_magazine = max_magazine {
	bullet_gui_timer++;
	if bullet_gui_timer > 30 _show_bullets = false;
} else bullet_gui_timer = 0;
if _show_bullets {
	for (var i = 0; i < 6; i++) {
		if i < current_magazine {
			draw_sprite(spr_bullet, 0, x + 25, y - 45 + (6 * i));
		} else draw_sprite(spr_bullet, 1, x + 25, y - 45 + (6 * i))
	}
}