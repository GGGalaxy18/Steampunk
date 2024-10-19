/// @description unpause
obj_menu_controller.dialog_pause = false;
obj_menu_controller.dialog_id = noone;
obj_menu_controller.paused = false;
instance_activate_all();
surface_free(obj_menu_controller.paused_surf);
obj_menu_controller.paused_surf = -1;