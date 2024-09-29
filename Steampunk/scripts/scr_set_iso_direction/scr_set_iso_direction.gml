function set_iso_direction(_dir) {
	switch (_dir) {
		case 45: return radtodeg(arctan2(1, 2));		// NE
		case 135: return radtodeg(arctan2(1, -2));		// NW
		case 225: return radtodeg(arctan2(-1, -2));		// SE
		case 315: return radtodeg(arctan2(-1, 2));		// SW
		default: return _dir;
	}
}