import java.lang.reflect.*;
public class Plant extends Actor{
   String name;
   Timer ICD;
   int cost;
   int health;
   boolean grounded;
   boolean aquatic;
   PImage sprite;
   Green green;



public Plant(String name, float x, float y, int cost){
   this(name, x, y, cost, false, false);
}

public Plant(String name, float x, float y, int cost, boolean aquatic, boolean grounded){
   super(x, y, loadImage("Sprites/Plants/" + name + ".png"));
   green = Green.getInstance(); 
   this.name = name;
   this.cost = cost;
   this.aquatic = aquatic;
   this.grounded = grounded;
}

  public void spawn(){
    Green.getWorld().addObject(this); 
  }

  public int getHealth(){
   return this.health; 
  }
  
  public int getCost(){
    return this.cost;
  }
  
  public void act(float deltaTime){
   //if see zombie then shoot
   //animate
  if(Timer == 0){
   this.projectile = new Projectile(this.x, this.y, PImage image); 
  }
  
  }


}

public class Peashooter extends Plant{
 public Peashooter(float x, float y){
   super("Peashooter",x,y,100);
 }
  
}
