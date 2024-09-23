/// @description animation_end(sprite_index, image_index, rate)
/// @param {real} <sprite_index> The index of the sprite being animated
/// @param {real} <image_index> The current frame value
/// @param {real} <rate> -See Below-
///		The rate of change in frames per step if not
///		using built in image_index/image_speed.
///		Don't use if you don't think you need this. You probably don't.

// returns true if the animation will loop this step.

// script courtesy of PixellatedPope & Minty Python from the GameMake subreddit discord
// https://www.reddit.com/r/gamemaker/wiki/discord
function animation_end(){
	var _type = sprite_get_speed_type(sprite_index);
	var _spd = sprite_get_speed(sprite_index)*image_speed;
	if (_type == spritespeed_framespersecond) { _spd /= game_get_speed(gamespeed_fps); }
	return image_index + _spd >= sprite_get_number(sprite_index);
}