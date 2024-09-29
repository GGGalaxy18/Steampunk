#macro MAP_W 23
#macro MAP_H 40
#macro TILE_W 32
#macro TILE_H 16
#macro ROOM_W 736
#macro ROOM_H 1280

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
	ATTACK_DASH,
	DASH
}

enum ENEMYSTATE
{
	FREE,
	HIT,
	DEAD
}