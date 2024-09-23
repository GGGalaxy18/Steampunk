function tile_to_room_x(_tX, _tY){
	return ((_tX - _tY) * (TILE_W * 0.5));
}

function tile_to_room_y(_tX, _tY){
	return ((_tX + _tY) * (TILE_H * 0.5));
}