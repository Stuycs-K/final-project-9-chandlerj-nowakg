//list of zombies that can only go in 1 direction
//list of projectiles similarly to zombies
 import java.util.*;
 import Green.*;
public class Zombie extends Actor{
  String name;
  int health;
  float walkSpeed;
  int biteSpeed;
  int biteDamage = 10; //i think this is the same for all zombies except guarantuar..? 
  PImage sprite;
  
  
public Zombie(String name, float y, int health, float walkSpeed){
  super(1300, y, loadImage("Sprites/Zombies/" + name + ".png"), 0.25f);
  this.name = name;
  this.health = health;
  this.walkSpeed = walkSpeed;
  this.biteSpeed = 1;
  //sprite = "Basic.png"; //placeholder name for the gif we end up using
}

public void setHealth(int health){
 this.health = health;
 System.out.println("set: "+health);
}

public  void act(float deltaTime){
 move(-1 * walkSpeed);
 if(health <= 0){
  getWorld().removeObject(this);
 }
}

public void inflictDamage(Plant plant, int amount){
    plant.health -= amount;
  }
}

public class Regular extends Zombie{
 public Regular(float y){
   super("Regular",y, 200, 1);
 }
}
public class Conehead extends Zombie{
 public Conehead(float y){
   super("Conehead",y, 640, 1);
 }
}
