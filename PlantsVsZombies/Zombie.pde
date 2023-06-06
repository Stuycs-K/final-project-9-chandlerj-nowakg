//list of zombies that can only go in 1 direction
//list of projectiles similarly to zombies
 import java.util.*;
 import Green.*;
public class Zombie extends Actor{
  String name;
  int health;
  float walkSpeed;
  int biteCoolDown;
  Timer biteTimer;
  int biteDamage = 10; //i think this is the same for all zombies except guarantuar..? 
  PImage sprite;
  World level;
  
  
public Zombie(String name, float y, int health, float walkSpeed){
  super(1300, y, loadImage("Sprites/Zombies/" + name + ".png"), 0.25f);
  this.name = name;
  this.health = health;
  this.walkSpeed = walkSpeed;
  this.biteCoolDown = 1;
  biteTimer= new Timer(biteCoolDown);
  level = Green.getWorld();

  //sprite = "Basic.png"; //placeholder name for the gif we end up using
}

public void setHealth(int health){
 this.health = health;
}

Plant victim;

public  void act(float deltaTime){

   if(health <= 0){
    level.removeObject(this);
    
   }
   
 
   victim = getOneIntersectingObject(Plant.class);
      
    if(victim != null){ //on hit
      bite(victim);
      //play eating animation?
    }
    else{
      move(-1 * walkSpeed);
      //play walking animation?
    }
 

}

public void bite(Plant plant){
    if(biteTimer.done()){
      plant.setHealth(plant.health - biteDamage);
      biteTimer.reset();
    }
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
