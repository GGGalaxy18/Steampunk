/// @description variable definitions
// Dash state
can_dash = true;
in_dash = false;
dash_queue = [];

// Melee attack state
can_attack = true;

// Ranged attack state
can_shoot = true;
in_reload = false;
current_magazine = max_magazine;

// Is hit state
can_be_hit = true;
is_hit = false;

blend = image_blend;
blend_time = 0;

// Dead state
is_dead = false;

xdir = 0;
ydir = 0;

// Sets the player position in the rendered room based on "MAP" instance layer position
// Should be in every object's create event where position on map matters
var _rX = room_to_tileroom_x(x, y);
var _rY = room_to_tileroom_y(x, y);
x = _rX;
y = _rY;

previous_sprite = sprite_index;
base_y_offset = sprite_get_yoffset(sprite_index);

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


//player health
hp = player_health;
hp_max = hp;

healthbar_width = 200;
healthbar_hieght = 24;
healthbar_x = (320/2) - (healthbar_width/2);
healthbar_y =  y - 150;

//player ability gauges
gauge_x = 1300;
gauge_y = 700;

