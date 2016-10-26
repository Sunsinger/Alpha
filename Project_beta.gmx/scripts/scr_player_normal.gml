scr_getInputs();

//reaction to movements
move = key_left + key_right;
hsp = move * movespeed;
if(vsp < 10) vsp += grav;

/*
Obsolete due to platforms: If you jump up throug a platform to be exactly
one pixel above it, this code will run, and will set the verticle speed to be zero
or jumpspeed, causing you to stick to the platform as you jump up through it instead of 
continuing with your momentum, looking unnatural.
if (place_meeting(x,y+1,obj_wall)){
    vsp = key_jump * -jumpspeed
}
*/

/*
This if will only set verticle speed when the jump key is pressed, avoiding the problem above.
*/
if (place_meeting(x,y+1,obj_wall)){
    if(key_jump) vsp = -jumpspeed
}

scr_collideAndMove();
