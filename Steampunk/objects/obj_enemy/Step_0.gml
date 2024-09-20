/// @description movement implementation


direction = point_direction(x,y,obj_player.x, obj_player.y)

// Keeps enemy within room
x = clamp(x, sprite_width/2, room_width-sprite_width/2)
y = clamp(y, sprite_height/2, room_height-sprite_height/2)
