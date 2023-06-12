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
  super(1300, y, 10, 10);
  this.name = name;
  this.health = health;
  this.walkSpeed = walkSpeed;
  this.biteCoolDown = 60;
  this.sprite =loadImage("Sprites/Zombies/" + name + ".png");
  biteTimer= new Timer(biteCoolDown);
  level = Green.getWorld();

  //sprite = "Basic.png"; //placeholder name for the gif we end up using
}

public void addedToWorld(World world){

 setImage(sprite);
 setDimensions(100, 140);
 
}

public void setHealth(int health){
 this.health = health;
}


Plant victim;

public  void act(float deltaTime){

   if(health <= 0){
     Collectable drop;
    int r = (int)(Math.random()*10)+1;
    if(r % 2 == 0){
     drop = new SilverCoin(this.getX(),this.getY()); 
     level.addObject(drop);
    }
    else if(r == 9){
      drop = new Diamond(this.getX(),this.getY());
      level.addObject(drop);
    }
     level.removeObject(this);
   }
   
   if(this.getX() < 125){
    ((Level) getWorld()).gameOver();
   }
   
 
   victim = getOneIntersectingObject(Plant.class);
      
    if(victim != null && victim.name != "Spikeweed" && victim.name != "Spikerock"){ //on hit
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


 //NEED TO ADJUST SPEED OF ALL THESE LATER
 
public class Regular extends Zombie{
 public Regular(float y){
   super("Regular",y, 100, 1);
 }
}
public class Conehead extends Zombie{
 public Conehead(float y){
   super("Conehead",y, 280, 1);
 }
}
public class Buckethead extends Zombie{
 public Buckethead(float y){
   super("Buckethead",y, 650, 1);
 }
}
public class Polevaulter extends Zombie{
 public Polevaulter(float y){
   super("Polevaulter",y, 170, 2);
 }
}
public class Newspaper extends Zombie{
 public Newspaper(float y){
   super("Newspaper",y, 170, 1);
 }
}
public class Screendoor extends Zombie{
 public Screendoor(float y){
   super("Screendoor",y, 650, 1);
 }
}
public class Football extends Zombie{
 public Football(float y){
   super("Football",y, 800, 2);
 }
}
public class Disco extends Zombie{
 public Disco(float y){
   super("Disco",y, 170, 1);
 }
}
public class Backupdancer extends Zombie{
 public Backupdancer(float y){
   super("Backupdancer",y, 100, 1);
 }
}
public class Duckytube extends Zombie{
 public Duckytube(float y){
   super("Duckytube",y, 100, 1);
 }
}
public class Snorkel extends Zombie{
 public Snorkel(float y){
   super("Snorkel",y, 100, 1);
 }
}
public class Dolphinrider extends Zombie{
 public Dolphinrider(float y){
   super("Dolphinrider",y, 170, 3);
 }
}
public class Jackinthebox extends Zombie{
 public Jackinthebox(float y){
   super("Jackinthebox",y, 170, 1);
 }
}
public class Balloon extends Zombie{
 public Balloon(float y){
   super("Balloon",y, 110, 1);
 }
}
public class Digger extends Zombie{
 public Digger(float y){
   super("Digger",y, 150, 1);
 }
}
public class Pogo extends Zombie{
 public Pogo(float y){
   super("Pogo",y, 170, 1);
 }
}
public class Yeti extends Zombie{
 public Yeti(float y){
   super("Yeti",y, 460, 1);
 }
}
public class Bungee extends Zombie{
 public Bungee(float y){
   super("Bungee",y, 230, 0); //might need to change speed bc it doens't move horizontally
 }
}
public class Ladder extends Zombie{
 public Ladder(float y){
   super("Ladder",y, 420, 1);
 }
}
public class Catapult extends Zombie{
 public Catapult(float y){
   super("Ladder",y, 330, 1);
 }
}
public class Gargantuar extends Zombie{
 public Gargantuar(float y){
   super("Gargantuar",y, 1500, .5);
 }
}
public class Imp extends Zombie{
 public Imp(float y){
   super("Imp",y, 50, 2);
 }
}
