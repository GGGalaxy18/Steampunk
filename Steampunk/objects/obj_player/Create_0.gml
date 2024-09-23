/// @description variable definitions
can_dash = true;
in_dash = false;
dash_queue = [];

can_attack = true;

xdir = 0;
ydir = 0;
friction = .4; // slows the player down (reduces speed)

var _rX = room_to_tileroom_x(x, y + sprite_height/2);
var _rY = room_to_tileroom_y(x, y + sprite_height/2);
x = _rX;
y = _rY - sprite_height/2;

hit_by_attack= ds_list_create();
state = PLAYERSTATE.FREE;

// control declarations
left = noone;
right = noone;
up = noone;
down = noone;
dash = noone;
attack = noone;