//list of zombies that can only go in 1 direction
//list of projectiles similarly to zombies
 import java.util.*;
 import Green.*;
public class Zombie extends Actor{
  String name;
  int health;
  float walkSpeed;
  int biteSpeed;
  int biteDamage = 10; //i think..? 
  PImage sprite;
  
  
public Zombie(String name, float x, float y, int health, float walkSpeed){
  super(1300, height/2, loadImage("Sprites/Plants/Peashooter.png"));
  this.name = name;
  this.health = health;
  this.walkSpeed = walkSpeed;
  this.biteSpeed = 1;
  //sprite = "Basic.png"; //placeholder name for the gif we end up using
}

public void setHealth(int health){
 this.health = health;
}
public  void act(){
 //gotta make the zombies actually move
 if(this.health < 0){
  getWorld().removeObject(this);
 }
}

public void inflictDamage(Plant plant, int amount){
    plant.health -= amount;
  }
}

public class Regular extends Zombie{
 public Regular(float x, float y){
   super("Peashooter",x,y, 200, 10);
 }
}
public class Conehead extends Zombie{
 public Conehead(float x, float y){
   super("Peashooter",x,y, 640, 20);
 }
}
