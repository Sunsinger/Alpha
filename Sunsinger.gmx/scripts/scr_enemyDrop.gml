//Item drops from enemies
var enemyX;
var enemyY
var willDrop = 1;
enemyX = argument0;
enemyY = argument1;
willDrop = random(100);
if(willDrop >= 50){
instance_create(enemyX,enemyY,obj_life);
}
