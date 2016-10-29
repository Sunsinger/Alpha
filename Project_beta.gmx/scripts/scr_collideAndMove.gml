scr_getInputs();

//Need new varaible because adding to hsp would be added every frame, causing acceleration
var hsp_final = hsp + hsp_carry;
hsp_carry = 0; //Only gain extra speed while on platform.

//horizontal collision
if(place_meeting(x+hsp_final,y,obj_wall)){
    while(!place_meeting(x+sign(hsp_final),y,obj_wall)){
    x += sign(hsp_final);
    }
    hsp_final = 0;
    hsp = 0;
}
x += hsp_final;


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
    if (vsp < 0) {
        if (doublejump == 0)sprite_index = spr_player_double_jump;
        else sprite_index = spr_player_jump; 
        }
    else sprite_index = spr_player_fall;
}
