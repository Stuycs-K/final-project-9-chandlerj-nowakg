import java.lang.reflect.*;
public class Plant extends Actor{
  
   Projectile[] projectileTemplates = {new Pea(), new Pea(), new Pea()}; //they won't ALL Be pea but you get the idea
   static final int PEA_PROJECTILE = 0;
   static final int SPORE_PROJECTILE = 1;
   //... etc
  
   String name;
   Timer ICD;
   int cost;
   int health;
   boolean grounded;
   boolean aquatic;
   PImage sprite;
   int projectileID;
   Green green;



public Plant(String name, int x, int y, int cost, int health, Timer Cooldown, int projectileID, boolean aquatic, boolean grounded){
   super(x, y, loadImage("Sprites/Plants/" + name + ".png"), 0.333333f);
   green = Green.getInstance(); 
   this.name = name;
   this.health = health;
   this.cost = cost;
   this.projectileID = projectileID;
   this.aquatic = aquatic;  
   this.grounded = grounded;
   this.ICD = Cooldown;
} 
  public void addedToWorld(){
    sprite = getImage();
    sprite.resize(100,100);
    setImage(sprite);
  }

public void act(float deltaTime){
   if(ICD.getStatus() == true){
     Projectile x = new Projectile(projectileTemplates[projectileID]);
     getWorld().addObject(x);
   }
 }


}

public class Peashooter extends Plant{
 public Peashooter(int x, int y){
   super("Peashooter",x,y,100,50,new Timer(1), PEA_PROJECTILE, false, true); //50 health, 100 sun cost, Pea projectile 
 }
  
}
