/// @description Set Iso coordinate

// Sets the position in the rendered room based on "MAP" instance layer position
// Should be in every object's create event where position on map matters
// Origin for building should be in the bottom corner (middle centre)
var _rX = room_to_tileroom_x(x, y);
var _rY = room_to_tileroom_y(x, y);
x = _rX;
y = _rY;