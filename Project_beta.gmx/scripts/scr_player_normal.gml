scr_getInputs();

//reaction to movements
move = key_left + key_right;
hsp = move * movespeed;
if(vsp < 10) vsp += grav;



if (place_meeting(x,y+1,obj_wall)){
vsp = key_jump * -jumpspeed
}

scr_collideAndMove();
