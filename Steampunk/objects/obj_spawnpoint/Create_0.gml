/// @description set spawn


// Sets the player position in the rendered room based on "MAP" instance layer position
// Should be in every object's create event where position on map matters
var _rX = room_to_tileroom_x(x, y);
var _rY = room_to_tileroom_y(x, y);
x = _rX;
y = _rY;

obj_player.x = x;
obj_player.y = y;