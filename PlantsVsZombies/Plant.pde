import java.lang.reflect.*;
public class Plant extends Actor{
   static final int NO_SHOOT = -1;
   static final int PEA_PROJECTILE = 0;
   static final int SNOW_PEA_PROJECTILE = 1;
   static final int FIRE_PEA_PROJECTILE = 2;
   
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
   Level level;



public Plant(String name, int x, int y, int cost, int health, Timer Cooldown, int projectileID, boolean aquatic, boolean grounded){
   super(x, y, 100, 100);
   green = Green.getInstance(); 
   this.sprite = loadImage("Sprites/Plants/" + name + ".png");
   this.name = name;
   this.health = health;
   this.cost = cost;
   this.projectileID = projectileID;
   this.aquatic = aquatic;  
   this.grounded = grounded;
   this.ICD = Cooldown;
   level = (Level) Green.getWorld();
   level.addObject(this);
} 
  public void addedToWorld(World world){
    setImage(sprite);
    System.out.println("" + getX() + " " + getY());
  }
  
  
  public void setHealth(int health){
 this.health = health;
}


public void act(float deltaTime){
  if(health <= 0){
    level.removeObject(this);
   }
  
   if(projectileID != NO_SHOOT && ICD.done() == true){
     shoot();
   }
 }
 
 void shoot(){
   Projectile x = new Projectile(level.projectileTemplates[projectileID]);
     level.addObject(x);
     x.setZ(-10); //so it looks to be behind the peashooter and comes out of its mouse
     x.arm((int) getX(), (int) getY() - 20); //so it lines up with the opening of the peashooter a lil more
     ICD.reset();
 }


}

public class Peashooter extends Plant{
 public Peashooter(int x, int y){
   super("Peashooter",x,y,100,50,new Timer(60), PEA_PROJECTILE, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}
public class Sunflower extends Plant{ //needs to generate sun
 public Sunflower(int x, int y){
   super("Sunflower",x,y,100,50,new Timer(60), PEA_PROJECTILE, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}
public class Cherrybomb extends Plant{ //needs to not shoot and explode
 public Cherrybomb(int x, int y){
   super("Cherrybomb",x,y,100,50,new Timer(60), PEA_PROJECTILE, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}
public class Chomper extends Plant{ //needs to not shoot
 public Chomper(int x, int y){
   super("Chomper",x,y,100,50,new Timer(60), NO_SHOOT, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}
public class Potatomine extends Plant{ //needs to not shoot
 public Potatomine(int x, int y){
   super("Potatomine",x,y,100,50,new Timer(60), NO_SHOOT, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}
public class Repeater extends Plant{
  public Repeater(int x, int y){
    super("Repeater",x,y,100,50,new Timer(60),PEA_PROJECTILE, false, true);
  }
  @Override
  public void act(float deltaTime){
   if(ICD.done() == true){
     Projectile x = new Projectile(level.projectileTemplates[projectileID]);
     Projectile y = new Projectile(level.projectileTemplates[projectileID]);
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
public class Snowpea extends Plant{
 public Snowpea(int x, int y){
   super("Snowpea",x,y,100,50,new Timer(60), SNOW_PEA_PROJECTILE, false, true);
 }
}
public class Walnut extends Plant{ //needs to not shoot
 public Walnut(int x, int y){
   super("Walnut",x,y,100,50,new Timer(60), NO_SHOOT, false, true);
 }
}
public class Torchwood extends Plant{ //needs to not shoot
 public Torchwood(int x, int y){
   super("Torchwood",x,y,100,50,new Timer(60), NO_SHOOT, false, true);
 }
}
