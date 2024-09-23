/// @description variable definitions
can_dash = true;
in_dash = false;
dash_queue = [];

can_attack = true;

xdir = 0;
ydir = 0;
friction = .4; // slows the player down (reduces speed)

hit_by_attack= ds_list_create();
state = PLAYERSTATE.FREE;
enum PLAYERSTATE
{
	FREE,
	ATTACK_SLASH,
	ATTACK_SHOOT,
	ATTACK_DASH,
	DASH
}

// control declarations
left = noone;
right = noone;
up = noone;
down = noone;
dash = noone;
attack = noone;