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
   Random randomSeed;

//fix sun costs for plants

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
   randomSeed = level.randomSeed;
} 
  public void addedToWorld(World world){
    setImage(sprite);
    //System.out.println("" + getX() + " " + getY());
  }
  
  
  public void setHealth(int health){
 this.health = health;
}

public int getCost(){
  return this.cost;
}

public void shoot(){
   Projectile x = new Projectile(level.projectileTemplates[projectileID]);
     level.addObject(x);
     x.setZ(-10); //so it looks to be behind the peashooter and comes out of its mouse
     x.arm((int) getX(), (int) getY() - 20); //so it lines up with the opening of the peashooter a lil more
     ICD.reset();
   }
   
  Zombie victim;
public void damage(){
  int damage = 10;
      victim = getOneIntersectingObject(Zombie.class);
      
      if(victim != null){ //on hit
        victim.setHealth(victim.health - damage);
        ICD.reset();
      }
   }
public void act(float deltaTime){
  if(health <= 0){
    level.removeObject(this);
    level.lawn.removePlant((int) getX(), (int) getY());
   }
  
  if (ICD.done()){
    if (projectileID == NO_SHOOT){
      damage();
    }  
    else{
     shoot(); 
    }
  }
  
  
 }
}


public class Lawnmower extends Plant{
  boolean triggered;
 public Lawnmower(int x, int y){
  super("Lawnmower",  x, y, 0, 100000000, new Timer(1), NO_SHOOT, true, false);
   triggered = false;
 }
 //overrided
   public void act(float deltaTime){
   if (triggered){
     move(10f);
   }
   
   Zombie victim = getOneIntersectingObject(Zombie.class);
    
    if(victim != null){ //on hit
      victim.setHealth(victim.health - 100000000); 
      triggered = true;
    }
  if (getX() > width){
    level.removeObject(this);
  }
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
   super("Sunflower",x,y,50,50,new Timer(420), NO_SHOOT, false, true); //50 health, 100 sun cost, Pea projectile 
 }
 void damage(){
   level.generateSun(getX(), getY(), false, randomSeed); 
      ICD.reset();
 }
}

public class Twinsunflower extends Plant{
  public Twinsunflower(int x, int y){
       super("Twinsunflower",x,y,150,50,new Timer(420), NO_SHOOT, false, true); //50 health, 200 sun cost, Pea projectile 
  }
  void damage(){
   level.generateSun(getX() - 25, getY(), false, randomSeed); 
   level.generateSun(getX() + 25, getY(), false, randomSeed); 
      ICD.reset();
 }
}
public class Cherrybomb extends Plant{ //needs to not shoot and explode
 public Cherrybomb(int x, int y){
   super("Cherrybomb",x,y,150,50,new Timer(60), NO_SHOOT, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}
public class Chomper extends Plant{ //needs to not shoot
 public Chomper(int x, int y){
   super("Chomper",x,y,150,50,new Timer(3600, true), NO_SHOOT, false, true); //50 health, 100 sun cost, Pea projectile 
 }
 Zombie victim;
   
   void damage(){
      victim = getOneIntersectingObject(Zombie.class);
      
      if(victim != null){ //on hit
        victim.setHealth(victim.health - 800);
        level.removeObject(this);
      }
   }
}
public class Squash extends Plant{
  public Squash(int x, int y){
    super("Squash",x,y,50,100,new Timer(0), NO_SHOOT, false, true);
  }
  Zombie victim;
   
   void damage(){
      victim = getOneIntersectingObject(Zombie.class);
      
      if(victim != null){ //on hit
        victim.setHealth(victim.health - 800);
        level.removeObject(this);
      }
   }
}
public class Potatomine extends Plant{ //needs to not shoot
 public Potatomine(int x, int y){
   super("Potatomine",x,y,25,50,new Timer(60), NO_SHOOT, false, true); //50 health, 100 sun cost, Pea projectile 
 }
Zombie victim;
   
   void damage(){
      victim = getOneIntersectingObject(Zombie.class);
      
      if(victim != null){ //on hit
        victim.setHealth(victim.health - 800);
        level.removeObject(this);
      }
   }
     
    
}
public class CobCannon extends Plant{
  public CobCannon(int x, int y){
   super("CobCannon",x,y,500,250,new Timer(600), PEA_PROJECTILE, false, true);   
  }
}
public class Repeater extends Plant{
  public Repeater(int x, int y){
    super("Repeater",x,y,200,50,new Timer(60),PEA_PROJECTILE, false, true);
  }
  @Override
  public void shoot(){
     Projectile x = new Projectile(level.projectileTemplates[projectileID]);
     Projectile y = new Projectile(level.projectileTemplates[projectileID]);
     getWorld().addObject(x);
     getWorld().addObject(y);
     x.setZ(-10); //so it looks to be behind the peashooter and comes out of its mouse
     y.setZ(-10);
     x.arm((int) getX(), (int) getY() - 20); //so it lines up with the opening of the peashooter a lil more
     y.arm((int) getX() + 25, (int) getY()-20);
     ICD.reset();
 }
}
public class Snowpea extends Plant{
 public Snowpea(int x, int y){
   super("Snowpea",x,y,175,50,new Timer(60), SNOW_PEA_PROJECTILE, false, true);
 }
}
public class Walnut extends Plant{ //needs to not shoot
 public Walnut(int x, int y){
   super("Walnut",x,y,50,150,new Timer(60), NO_SHOOT, false, true);
 }
}

public class Tallnut extends Plant{ //needs to not shoot
 public Tallnut(int x, int y){
   super("Tallnut",x,y,125,300,new Timer(60), NO_SHOOT, false, true);
 }
}
public class Torchwood extends Plant{ //needs to not shoot
 public Torchwood(int x, int y){
   super("Torchwood",x,y,175,50,new Timer(60), NO_SHOOT, false, true);
 }
}
public class Fumeshroom extends Plant{
  public Fumeshroom(int x, int y){
    super("Fumeshroom",x,y,75,100,new Timer(60), NO_SHOOT, false, true);
  }
}
public class Sunshroom extends Plant{
  public Sunshroom(int x, int y){
    super("Sunshroom",x,y,25,100,new Timer(540), NO_SHOOT, false, true);
  }
  void damage(){
   level.generateSun(getX(), getY(), false, randomSeed); 
      ICD.reset();
 }
}
