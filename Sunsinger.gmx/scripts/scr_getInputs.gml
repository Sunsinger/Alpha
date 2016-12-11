//get player's input
key_right = keyboard_check(vk_right) || (gamepad_axis_value(0,gp_axislh) > 0);
key_left = keyboard_check(vk_left) || (gamepad_axis_value(0,gp_axislh) < 0);
key_jump = keyboard_check_pressed(vk_space) || (gamepad_button_check_pressed(0, gp_face1));
key_lightAttack = keyboard_check_pressed(ord('X')) || (gamepad_button_check_pressed(0, gp_face3));
key_down = keyboard_check(vk_down) ||  (gamepad_axis_value(0,gp_axislv) > 0);
key_shoot = keyboard_check_pressed(ord('Z')) || (gamepad_button_check_pressed(0,gp_shoulderrb));
key_pause = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0,gp_start);
key_quit = keyboard_check_pressed(ord('Q')) || gamepad_button_check_pressed(0,gp_select);
key_up = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0,gp_padu);
key_down = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0,gp_padd);
key_enter = (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0,gp_face1));
