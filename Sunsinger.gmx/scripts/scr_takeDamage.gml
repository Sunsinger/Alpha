if(!recently_hit){
 
if(lives > 0){
    audio_play_sound(snd_injured,11,0);
    lives -= 1;
    }
    recently_hit = true;
    //alarm[0] = 1 * room_speed;
    alarm[0] = 5;
    solid = false;
}
scr_playerCollideAndMove();


