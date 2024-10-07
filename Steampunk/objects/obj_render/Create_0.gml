/// @description Build the map

layer_set_visible("Map", false);

// Creates virtual map
global.the_map = ds_grid_create(MAP_W, MAP_H);

var _tile_map = layer_tilemap_get_id("Map");

for (var tX = 0; tX < MAP_W; tX++) {
	for (var tY = 0; tY < MAP_H; tY++) {
		var _tile_map_data = tilemap_get(_tile_map, tX, tY);
		// Format: [Sprite, Z]
		var _this_tile = [-1, 0];
		_this_tile[TILE.SPRITE] = _tile_map_data;
		_this_tile[TILE.Z] = irandom(2);			// Changes tile height (set irandom(n) or 0)
		if array_contains([2, 3], _this_tile[TILE.SPRITE]) { _this_tile[TILE.Z] -= 8 }; // Raise height of sidewalk
		global.the_map[# tX, tY] = _this_tile;
	}
}