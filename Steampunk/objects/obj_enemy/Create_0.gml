/// @description variable definitions
speed = roam_speed;

can_be_hit = true;
change_idle_roam = false;

directions = [0, set_iso_direction(45), 90, set_iso_direction(135), 180, set_iso_direction(225), 270, set_iso_direction(315)];
direction = directions[irandom(array_length(directions) - 1)];
xdir = 0;
ydir = 0;

original_sprite_offset_y = sprite_get_yoffset(sprite_index);

state = ENEMYSTATE.SEARCHING;

// Delete later
// Creates dot at enemy sprite origin
// Used to debug movement
col_struct = { enemy_instance: id };
col_id = instance_create_layer(x, y, "Instances", obj_enemy_col, col_struct);