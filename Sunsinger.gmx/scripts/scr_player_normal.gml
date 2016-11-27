scr_getInputs();

//Are you light attacking?
if(key_lightAttack && (place_meeting(x,y+1, obj_wall))){
    state = states.light_attack;
    audio_play_sound(snd_punch,10,0);
}

//Aerial Attack Cooldown
if(place_meeting(x, y+1, obj_wall))
    canAerial = 1;

//Are you aerial attacking?
if(key_lightAttack && (!place_meeting(x, y+1, obj_wall)) && canAerial){
    state = states.aerial_attack;
    audio_play_sound(snd_punch, 10, 0); //Placeholder sound
}

//Shoot projectile if cooldown has finished
if(key_shoot && obj_player.canShoot){
        //Create hitbox
        
    obj_player.canShoot = false;
    obj_player.alarm[2] = 180;
    
    with(instance_create(x+15, y-20, obj_fireball)){
        //Flip based on direction
        image_xscale = other.image_xscale;
    }    
    audio_play_sound(snd_punch, 10, 0); //Placeholder sound
}

//reaction to movements
move = key_left + key_right;

//full movement when on ground
if((place_meeting(x,y+1, obj_wall))){
    doublejump = 1; //restore double jump when touching ground

    if(key_left){
        if(hsp > -MAX_SPEED) hsp -=acc;
        facing = -1;
    }
    if(key_right){
        if(hsp < MAX_SPEED) 
            hsp +=acc;
        facing = 1;
    }
}
else{ //less conttrol while in the air
    if(key_left){
        if(hsp > -MAX_SPEED) 
            hsp -=acc/2;    
        facing = -1;
    }
    if(key_right){
        if(hsp < MAX_SPEED) 
            hsp +=acc/2;
        facing = 1;
    }
}

/*
This if will only set verticle speed when the jump key is pressed, avoiding the problem above.
*/
if (place_meeting(x,y+1,obj_wall)){        
    if(key_jump) {
    vsp = -jumpspeed * 1.5
    audio_play_sound(snd_jump,0,0); //play jump sound
    effect_create_below(ef_smoke, x, y+85, 1, c_gray);
    }
}

//double jump script
else if (!place_meeting(x,y+1,obj_wall) && doublejump && !((place_meeting(x+1,y,obj_wall)|| place_meeting(x-1,y,obj_wall)) && (key_jump) )){
    if(key_jump){
     vsp = -jumpspeed * 1.5
     doublejump=0;
    
    }
}

//wall jump script
if((place_meeting(x+1,y,obj_wall)|| place_meeting(x-1,y,obj_wall)) && (key_jump) ) {
    if(key_jump){
     vsp = -jumpspeed * 1.5; //1.5
     //vsp = -jumpspeed * 1;
     hsp = MAX_SPEED * -facing;
     facing = sign(hsp);
     
     image_xscale = facing;
     
     audio_play_sound(snd_jump,0,0); //play jump sound
     effect_create_below(ef_smoke, x, y+85, 1.5, c_gray);
    }
}


//Animate
if (move != 0) image_xscale = move;
if (place_meeting(x,y+1, obj_wall)){
    if (move != 0){
     sprite_index = spr_player_run;
    }
    else{
     sprite_index = spr_player_idle;
    }
}
else{
    if (vsp < 0) {
        if (doublejump == 0)sprite_index = spr_player_double_jump;
        else sprite_index = spr_player_jump; 
        }
    else sprite_index = spr_player_fall;
}

image_xscale = facing;
scr_playerCollideAndMove();
