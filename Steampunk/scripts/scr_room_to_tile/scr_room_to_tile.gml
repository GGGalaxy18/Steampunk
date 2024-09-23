function room_to_tile_x(_rX, _rY){
	return floor((_rX / (TILE_W * 0.5) + _rY / (TILE_H * 0.5)) * 0.5);
}

function room_to_tile_y(_rX, _rY){
	return floor((_rY / (TILE_H * 0.5) - (_rX / (TILE_W * 0.5))) * 0.5);
}