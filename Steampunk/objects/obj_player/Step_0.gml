xdir = keyboard_check(vk_right) - keyboard_check(vk_left)
ydir = keyboard_check(vk_down) - keyboard_check(vk_up)

if (xdir != 0) or (ydir != 0) {
	speed += 1;
	direction = point_direction(0, 0, xdir, ydir);
}

if not keyboard_check(vk_down) and not keyboard_check(vk_up) and not keyboard_check(vk_right) and not keyboard_check(vk_left)
	speed -= sign(speed);

// Later on, implement speed and direction so that diagonal speed isn't greater than cardinal speed
x = clamp(x, sprite_width/2, room_width-sprite_width/2);
y = clamp(y, sprite_height/2, room_height-sprite_height/2);
speed = clamp(speed, -7, 7);

if canDash and keyboard_check(vk_space) {
	// Implement dash mechanic
	canShoot = false;
	alarm[0] = dash_cooldown;
}