/// @description set speed and direction
direction = point_direction(obj_player.x, obj_player.y - obj_player.sprite_height/2, mouse_x, mouse_y);
image_angle = direction;
speed = bullet_speed;