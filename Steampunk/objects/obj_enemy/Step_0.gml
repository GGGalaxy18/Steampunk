/// @description state machine

// Makes enemy move with environment sprites
// TODO: currently broken
//sprite_set_offset(sprite_index, sprite_get_xoffset(sprite_index), original_sprite_offset_y - get_z(x, y));

// State Machine
switch (state) {
	case ENEMYSTATE.SEARCHING: scr_enemy_state_searching(); break;
	case ENEMYSTATE.PURSUIT: scr_enemy_state_pursuit(); break;
	case ENEMYSTATE.KNOCKBACK: scr_enemy_state_knockback(); break;
	case ENEMYSTATE.HIT: scr_enemy_state_hit(); break;
	case ENEMYSTATE.FLEE: scr_enemy_state_flee(); break;
	case ENEMYSTATE.DEAD: scr_enemy_state_dead(); break;
	case ENEMYSTATE.ATTACK: scr_enemy_state_attack(); break;
	case ENEMYSTATE.AMBUSH: scr_enemy_state_ambush(); break;
}