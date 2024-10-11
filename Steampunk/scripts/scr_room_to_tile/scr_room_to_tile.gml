function room_to_tile_x(_rX, _rY){
	return floor(_rX / TILE_W + _rY / TILE_H);
}

function room_to_tile_y(_rX, _rY){
	return floor(_rY / TILE_H - _rX / TILE_W);
}