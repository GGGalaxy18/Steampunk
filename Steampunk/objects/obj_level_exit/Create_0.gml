/// @description set to tileroom space
// Sets the position in the rendered room based on "MAP" instance layer position
var _rX = room_to_tileroom_x(x, y);
var _rY = room_to_tileroom_y(x, y);
x = _rX;
y = _rY;

can_show_dialog = true;