/// @description variable definitions
move_lock = false;

can_dash = true;
dash_queue = [];

can_attack = true;

xdir = 0;
ydir = 0;
friction = .4;

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