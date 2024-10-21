/// @description toggle fullscreen
if keyboard_check_pressed(ord("F")) and not paused window_set_fullscreen(!window_get_fullscreen());