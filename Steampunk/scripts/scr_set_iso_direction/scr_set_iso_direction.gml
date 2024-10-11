function set_iso_direction(_dir) {
	switch (_dir) {
		case 45: return NE;
		case 135: return NW;
		case 225: return SW;
		case 315: return SE;
		default: return _dir;
	}
}

function set_iso_direction_clamped(_dir) {
	var _min = 360;
	var _directions = [E, NE, N, NW, W, SW, S, SE];
	var _min_index = 0;
	for (var _i=0; _i<array_length(_directions); _i++) {
		if (abs(_directions[_i] - _dir) < _min) {
			_min = abs(_directions[_i] - _dir);
			_min_index = _i;
		}
	}
	return _directions[_min_index];
}