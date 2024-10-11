#macro MAP_W 80
#macro MAP_H 80
#macro TILE_W 32
#macro TILE_H 16
#macro ROOM_W 2560
#macro ROOM_H 2560

#macro E 0
#macro NE 26.57
#macro N 90
#macro NW 153.43
#macro W 180
#macro SW 206.57
#macro S 270
#macro SE 333.43

enum TILE
{
	SPRITE = 0,
	Z = 1
}

enum PLAYERSTATE
{
	FREE,
	ATTACK_SLASH,
	ATTACK_SHOOT,
	RELOAD,
	ATTACK_DASH,
	DASH
}

enum ENEMYSTATE
{
	AMBUSH,
	ATTACK,
	DEAD,
	FLEE,
	HIT,
	PURSUIT,
	SEARCHING
}