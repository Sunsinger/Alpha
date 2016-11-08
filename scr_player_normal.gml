scr_getInputs();


//Are you light attacking?
if(key_lightAttack)
    state = states.light_attack;

//reaction to movements
move = key_left + key_right;


//hsp = move * movespeed;
if(vsp < 20) vsp += grav;



//acceleration code

if(!keyboard_check(vk_right)&&!keyboard_check(vk_left) && (place_meeting(x,y+1, obj_wall))){
hsp -=(frict * sign(hsp))


//error checking to ensure player stops
if(hsp >= -.5 && hsp <= .5) hsp = 0;
}

//full movement when on ground
if((place_meeting(x,y+1, obj_wall))){
doublejump = 1; //restore double jump when touching ground

if(keyboard_check(vk_left)){
if(hsp > -MAX_SPEED) hsp -=acc;
facing = -1;
}

if(keyboard_check(vk_right)){
if(hsp < MAX_SPEED) hsp +=acc;
facing = 1;
}
}

else{ //less control while in the air
if(keyboard_check(vk_left)){
if(hsp > -MAX_SPEED) hsp -=acc/2;
facing = -1;
}

if(keyboard_check(vk_right)){
if(hsp < MAX_SPEED) hsp +=acc/2;
facing = 1;
}

}


/*
This if will only set verticle speed when the jump key is pressed, avoiding the problem above.
*/
if (place_meeting(x,y+1,obj_wall)){
    if(key_jump) vsp = -jumpspeed * 1.5
}

//double jump script
//checks if a player is in the air and has not doulbe-jumped already
else if (!place_meeting(x,y+1,obj_wall) && doublejump && !(place_meeting(x+1,y,obj_wall)|| place_meeting(x-1,y,obj_wall))){
    if(key_jump){
     vsp = -jumpspeed * 1.5
    doublejump=0;
    effect_create_above(ef_ring, x, y, 2, c_white)
    }
}


//wall jump script
//checks if player is touching a wall while in the air
if((place_meeting(x+1,y,obj_wall)|| place_meeting(x-1,y,obj_wall)) && !(place_meeting(x,y+1,obj_wall)) && (key_jump) ) {
    if(key_jump){
     vsp = -jumpspeed * 1.5
     vsp = -jumpspeed * 1;
     hsp = MAX_SPEED * -facing;
     facing = sign(hsp);
     
     image_xscale = facing;
    }
}



scr_collideAndMove();




