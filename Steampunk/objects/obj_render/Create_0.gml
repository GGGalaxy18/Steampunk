/// @description Build the map
layer_set_visible("Map", false);

// Creates virtual map
global.the_map = ds_grid_create(MAP_W, MAP_H);
// Creates collision map
global.col_the_map = ds_grid_create(MAP_W, MAP_H);
// Set walkable tiles
global.walkable = [1, 2, 3, 4];

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
		
for (var tX = 0; tX < MAP_W; tX++) {
	for (var tY = 0; tY < MAP_H; tY++) {
		var _tile_data = global.the_map[# tX, tY];	
		// Add invisble boundaries
		if not (array_contains(global.walkable, _tile_data[TILE.SPRITE])) {
			is_boundary = false;
			var _border_tile_data;
			for (var i=-1; i<=1; i++) {
				if (tX + i < 0 or tX + i >= MAP_W) continue;
				for (var j=-1; j<=1; j++) {
				if (tY + j < 0 or tY + j >= MAP_H) continue;
					_border_tile_data = global.the_map[# tX+i, tY+j];
					if array_contains(global.walkable, _border_tile_data[TILE.SPRITE]) {
						is_boundary = true;
						break;
					}
				}
				if is_boundary break;
			}
			if is_boundary {
				global.col_the_map[# tX, tY] = 1;
				var _rX = tile_to_room_x(tX, tY);
				var _rY = tile_to_room_y(tX, tY);
				//instance_create_layer(tileroom_to_room_x(_rX, _rY), tileroom_to_room_y(_rX, _rY), "RenderInstance", obj_boundary);
				instance_create_layer(_rX, _rY, "Buildings", obj_boundary);
			} else global.col_the_map[# tX, tY] = 0;
		}
	}
}