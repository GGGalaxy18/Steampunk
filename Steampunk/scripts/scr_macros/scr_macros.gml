#macro MAP_W 42
#macro MAP_H 24
#macro TILE_W 32
#macro TILE_H 16
#macro ROOM_W 1344
#macro ROOM_H 768

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