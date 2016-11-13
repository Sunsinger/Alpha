//Can only aerial attack once per jump
canAerial = 0;

//start animation
sprite_index = spr_player_aa;

//check if in animation damage frames
if(image_index >= 1 && image_index <= 3){
    //create hitbox
    with(instance_create(x, y, obj_hb_player_aa)){
        //Flip based on direction
        image_xscale = other.image_xscale;
        
        //Collision between hitbox and enemy
        with(instance_place(x, y, obj_bird)){
            instance_destroy();
        }
        //Collision between hitbox and enemy
        with(instance_place(x, y, obj_minion)){
            instance_destroy();
        }
        //Collision between hitbox and enemy
        with(instance_place(x, y, obj_slime)){
            instance_destroy();
        }
    }
}
scr_collideAndMove();
