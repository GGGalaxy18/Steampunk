/// @description 

dialogs = [];

add = function(_sprite, _message) {
	array_push(dialogs, { sprite: _sprite, message: _message });
};

pop = function() { return array_shift(dialogs); };

count = function() { return array_length(dialogs); };

key_next = vk_anykey;

showing_dialog = false;

current_dialog = {};

alpha = 0;


can_proceed = false