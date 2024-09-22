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
function animation_end(_sprite, _image){
	_sprite = sprite_index;
	_image = image_index;
	var tempVariable = 0;
}