/// @description GUI
// You can write your code in this editor
draw_sprite_stretched(spr_health,0,healthbar_x,healthbar_y,(hp/hp_max)*healthbar_width, healthbar_hieght);
draw_sprite(spr_healthbar,0,healthbar_x,healthbar_y);

//ability gauges
draw_sprite(spr_ability_dial,0,gauge_x,gauge_y);
draw_sprite(spr_ability_dial,0,gauge_x-120,gauge_y);
draw_sprite(spr_ability_dial,0,gauge_x-240,gauge_y);