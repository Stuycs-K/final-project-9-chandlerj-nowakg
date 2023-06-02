import java.lang.reflect.*;
public class Plant extends Actor{
   String name;
   Timer ICD;
   int cost;
   int health;
   boolean grounded;
   boolean aquatic;
   PImage sprite;
   int xPos;
   int yPos;
   Green green;



public Plant(String name, int x, int y, int cost, int health, Timer Cooldown, boolean aquatic, boolean grounded){
   super(x, y, loadImage("Sprites/Plants/" + name + ".png"), 0.333333f);
   green = Green.getInstance(); 
   this.name = name;
   this.health = health;
   this.cost = cost;
   this.aquatic = aquatic;  
   this.grounded = grounded;
   this.ICD = Cooldown;
   this.xPos = x;
   this.yPos = y;
} 
  public void addedToWorld(){
    sprite = getImage();
    sprite.resize(100,100);
    setImage(sprite);
  }

public void act(float deltaTime){
   if(ICD.getStatus() == true){
     PImage projSprite = loadImage(this.name+"Projectile.png");
     Projectile x = new Projectile(xPos, yPos, 10, projSprite);
     getWorld().addObject(x);
   }
 }


}

public class Peashooter extends Plant{
 public Peashooter(int x, int y){
   super("Peashooter",x,y,100,100,new Timer(1),false, true);
 }
  
}
