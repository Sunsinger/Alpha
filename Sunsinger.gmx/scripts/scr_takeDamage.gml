if(!invulnerable && !spike_hit){
 
    if(lives > 0){
        audio_play_sound(snd_injured,11,0);
        lives -= 1;
    }
    invulnerable = true;
    alarm[0] = 5;
    solid = false;
}
else if(!invulnerable && spike_hit){
    if(lives > 0){
        audio_play_sound(snd_injured,11,0);
        lives -= 1;
    }
    invulnerable = true;
    
    alarm[0] = 45;
    solid = false;
}
scr_playerCollideAndMove();


