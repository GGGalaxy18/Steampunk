/// @description variable definitions
can_dash = true;
in_dash = false;
dash_queue = [];

can_attack = true;

can_shoot = true;
in_reload = false;
current_magazine = max_magazine;

xdir = 0;
ydir = 0;

// Sets the player position in the rendered room based on "MAP" instance layer position
// Should be in every object's create event where position on map matters
var _rX = room_to_tileroom_x(x, y + sprite_height/2);
var _rY = room_to_tileroom_y(x, y + sprite_height/2);
x = _rX;
y = _rY - sprite_height/2;

hit_by_attack= ds_list_create();	// Tracks enemies hit during anim sequence (prevents multi hits)
state = PLAYERSTATE.FREE;

// control declarations
left = noone;
right = noone;
up = noone;
down = noone;
dash = noone;
melee_attack = noone;
ranged_attack = noone;
reload = noone;