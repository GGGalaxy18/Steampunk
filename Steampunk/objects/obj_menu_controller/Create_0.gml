/// @description pause variables
dialog_pause = false;
dialog_id = noone;
paused = false;
paused_surf = -1;

// keep player info for pause
playerx = 0;
playery = 0;

instance_create_layer(x, y, "Instances", obj_dialogue_entry);
