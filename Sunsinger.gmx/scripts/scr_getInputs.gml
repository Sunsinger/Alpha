//get player's input
var enabled;
enabled = argument0;
if(enabled == 1){
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);
key_lightAttack = keyboard_check_pressed(ord('X'));
key_down = keyboard_check(vk_down);
key_shoot = keyboard_check_pressed(ord('Z'));
}
