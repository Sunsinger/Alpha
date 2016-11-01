var damagePoints;
damagePoints = argument0;
if(!recently_hit){
 
if(health > damagePoints && lives > 0){
    health -= damagePoints;
    }else if(lives > 0){
    lives -= 1;
    health = 100;
    }
    recently_hit = true;
    alarm[0] = 1 * room_speed;
    solid = false;
    
}


