/// @description variable definitions
speed = move_speed;
can_be_hit = true;

// Sets the enemy position in the rendered room
// based on "MAP" instance layer position
var _rX = room_to_tileroom_x(x, y + sprite_height/2);
var _rY = room_to_tileroom_y(x, y + sprite_height/2);
x = _rX;
y = _rY - sprite_height/2;