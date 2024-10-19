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
bullet_gui_timer = 30;

// Is hit state
can_be_hit = true;
is_hit = false;

blend = image_blend;
blend_time = 0;

// Dead state
is_dead = false;

xdir = 0;
ydir = 0;

previous_sprite = sprite_index;
base_y_offset = sprite_get_yoffset(sprite_index);

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
heal_timer = 0;

healthbar_width = 200;
healthbar_hieght = 24;
healthbar_x = (320/2) - (healthbar_width/2);
healthbar_y =  50;

//player ability gauges
gauge_x = 1300;
gauge_y = 700;

// scrap stuff
num_scrap = 0;

in_dialog = false;