function room_to_tileroom_x(_rX, _rY){
	var _tX = floor(_rX / TILE_W);
	var _tY = floor(_rY / TILE_W);
	return tile_to_room_x(_tX, _tY);
}

function room_to_tileroom_y(_rX, _rY){
	var _tX = floor(_rX / TILE_W);
	var _tY = floor(_rY / TILE_W);
	return tile_to_room_y(_tX, _tY);
}