/// @description variable definitions
speed = roam_speed;

blend = image_blend;
blend_time = 0;

can_be_hit = true;
can_attack = true;
is_hit = false;
is_dead = false;
change_idle_roam = false;

directions = [E, NE, N, NW, W, SW, S, SE];
direction = directions[irandom(array_length(directions) - 1)];
xdir = 0;
ydir = 0;

original_sprite_offset_y = sprite_get_yoffset(sprite_index);

state = ENEMYSTATE.SEARCHING;

col_struct = { enemy_instance: id };
col_id = instance_create_layer(x, y, "Instances", obj_enemy_col, col_struct);