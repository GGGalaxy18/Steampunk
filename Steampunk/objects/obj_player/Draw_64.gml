/// @description GUI
// You can write your code in this editor
if not in_dialog {
	// health bar
	var _healthbar_xoffset = 20;
	draw_sprite_stretched(spr_health,0,healthbar_x,healthbar_y,(hp/hp_max)*(healthbar_width - _healthbar_xoffset), healthbar_hieght);
	draw_sprite(spr_healthbar,0,healthbar_x,healthbar_y);
	
	// scrap counter
	draw_text_transformed(healthbar_x + 40, healthbar_y + 65, "x" + string(num_scrap), 2, 2, 0);
	draw_sprite_stretched(spr_bloodied_scraps, 0, healthbar_x - 40, healthbar_y + 30, 90, 90);

	// ability gauges
	var _dash_rotation = 180*(alarm_get(1)/dash_cooldown) - 180;
	var _melee_rotation = 180*(alarm_get(2)/melee_cooldown) - 180;

	// first dash
	draw_sprite_ext(spr_ability_dial_bar, 0, gauge_x, gauge_y-9, 1, 1, _dash_rotation, c_white, 1);
	draw_sprite(spr_ability_dial,0,gauge_x,gauge_y);

	// second dash
	if not (array_length(dash_queue) == 2 and dash_queue[1] == -1) _dash_rotation = -180;
	draw_sprite_ext(spr_ability_dial_bar, 0, gauge_x-120, gauge_y-9, 1, 1, _dash_rotation, c_white, 1);
	draw_sprite(spr_ability_dial,0,gauge_x-120,gauge_y);

	// melee cooldown (change later)
	draw_sprite_ext(spr_ability_dial_bar, 0, gauge_x-240, gauge_y-9, 1, 1, _melee_rotation, c_white, 1);
	draw_sprite(spr_ability_dial,0,gauge_x-240,gauge_y);
}
