//list of zombies that can only go in 1 direction
//list of projectiles similarly to zombies
 import java.util.*;
 import Green.*;
public class Zombie extends Actor{
  String name;
  int health;
  int walkSpeed;
  int biteSpeed;
  PImage sprite;
  
public Zombie(){
  name = "Zombie";
  health = 10;
  spawnedRow;
  walkSpeed = 1;
  biteSpeed = 1;
  spawnRow = 1;
  //sprite = "Basic.png"; //placeholder name for the gif we end up using
}

public Zombie(String name, int spawnRow; int health, int walkSpeed, int biteSpeed){
  this.health = health;
  this.spawnRow = spawnRow;
  this.biteSpeed = bitespeed;
  this.sprite = name + ".png";

public abstract void act(){
 this.SpawnZombie();
 //gotta make the zombies actually move
 if(this.health < 0){
  getWorld().removeObject(this);
 }
}
//spawns in the zombies; since we're just dealing with basic zombies we can keep it like this
public void spawnZombie(){
   Green.getWorld().addObject(this); 
}

public void setHealth(int damage){
 this.health -= damage;
}
}
