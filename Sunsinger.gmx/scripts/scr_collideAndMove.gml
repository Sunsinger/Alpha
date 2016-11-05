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
