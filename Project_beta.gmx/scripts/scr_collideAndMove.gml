scr_getInputs();

//horizontal collision
if(place_meeting(x+hsp,y,obj_wall)){
    while(!place_meeting(x+sign(hsp),y,obj_wall)){
    x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;


//vertical collision
if(place_meeting(x,y+vsp,obj_wall)){
    while(!place_meeting(x,y+sign(vsp),obj_wall)){
    y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;


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
    if (vsp < 0) sprite_index = spr_player_jump; else sprite_index = spr_player_fall;
}
