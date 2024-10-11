/// @description get rid of DS stuff to prevent memory leaks
ds_grid_destroy(global.the_map);
ds_grid_destroy(global.col_the_map);