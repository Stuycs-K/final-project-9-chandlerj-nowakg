import java.lang.reflect.*;
public class Plant extends Actor{
   String name;
   Timer ICD;
   int cost;
   int health;
   boolean grounded;
   boolean aquatic;
   PImage sprite;
   Projectile projectile;
   
   Green green;



public Plant(String name, float x, float y, int cost, int health, Projectile project){
   this(name, x, y, cost, health, false, false, project);
}

public Plant(String name, float x, float y, int cost, int health, Projectile project, boolean aquatic, boolean grounded){
   super(x, y, loadImage("Sprites/Plants/" + name + ".png"), 0.333333f);
   green = Green.getInstance(); 
   this.name = name;
   this.cost = cost;
   this.projectile = projectile;
   this.aquatic = aquatic;  
   this.grounded = grounded;
} 
  public void prepare(){
    sprite = getImage();
    sprite.resize(100,100);
   setImage(sprite);
  }

public void act(float deltaTime){
  if(Timer == 0){
   this.projectile = new Pea(this.x, this.y); 
  }
 }


}

public class Peashooter extends Plant{
 public Peashooter(float x, float y){
   super("Peashooter",x,y,100,50, new Pea(getX(), getY()));   //50 health, 100 sun cost, Pea projectile
 }
  
}
