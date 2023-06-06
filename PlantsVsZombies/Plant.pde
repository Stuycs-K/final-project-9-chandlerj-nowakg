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
   World level;



public Plant(String name, int x, int y, int cost, int health, Timer Cooldown, int projectileID, boolean aquatic, boolean grounded){
   super(x, y, loadImage("Sprites/Plants/" +  "Peashooter.png"), 0.5f);
   green = Green.getInstance(); 
   this.name = name;
   this.health = health;
   this.cost = cost;
   this.projectileID = projectileID;
   this.aquatic = aquatic;  
   this.grounded = grounded;
   this.ICD = Cooldown;
   level = Green.getWorld();
} 
  public void addedToWorld(World world){
    sprite = getImage();
    sprite.resize(100,100);
    setImage(sprite);
  }
  
  public void setHealth(int health){
 this.health = health;
}

public void act(float deltaTime){
  if(health <= 0){
    level.removeObject(this);
   }
  
  
   if(ICD.done() == true){
     Projectile x = new Projectile(projectileTemplates[projectileID]);
     level.addObject(x);
     x.setZ(-10); //so it looks to be behind the peashooter and comes out of its mouse
     x.arm((int) getX(), (int) getY() - 20); //so it lines up with the opening of the peashooter a lil more
     ICD.reset();
   }
 }


}

public class Peashooter extends Plant{
 public Peashooter(int x, int y){
   super("Peashooter",x,y,100,50,new Timer(1), PEA_PROJECTILE, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}
public class SnowShooter extends Plant{
 public SnowShooter(int x, int y){
   super("SnowShooter",x,y,100,50,new Timer(1), PEA_PROJECTILE, false, true);
 }
}
public class Repeater extends Plant{
  public Repeater(int x, int y){
    super("Repeater",x,y,100,50,new Timer(1), PEA_PROJECTILE, false, true);
  }
  @Override
  public void act(float deltaTime){
   if(ICD.done() == true){
     Projectile x = new Projectile(projectileTemplates[projectileID]);
     Projectile y = new Projectile(projectileTemplates[projectileID]);
     getWorld().addObject(x);
     getWorld().addObject(y);
     x.setZ(-10); //so it looks to be behind the peashooter and comes out of its mouse
     y.setZ(-10);
     x.arm((int) getX(), (int) getY() - 20); //so it lines up with the opening of the peashooter a lil more
     y.arm((int) getX(), (int) getY()-20);
     ICD.reset();
   }
 }
}
