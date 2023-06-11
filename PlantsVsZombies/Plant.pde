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

public int getCost(){
  return this.cost;
}


public void act(float deltaTime){
  if(health <= 0){
    level.removeObject(this);
   }
  
   if(projectileID != NO_SHOOT && ICD.done() == true){
     Projectile x = new Projectile(level.projectileTemplates[projectileID]);
     level.addObject(x);
     x.setZ(-10); //so it looks to be behind the peashooter and comes out of its mouse
     x.arm((int) getX(), (int) getY() - 20); //so it lines up with the opening of the peashooter a lil more
     ICD.reset();
   }
   if(this.name == "Sunflower" || this.name == "Twinsunflower" || this.name == "SunShroom"){
     if(ICD.done()){
       float z = this.getX();
       Random seed = new Random();
       z += seed.nextInt(10); //so there's a little variation on where it spawns from the sky and from the plant 
      Collectable sun = new Sun(z, this.getY(), false, seed);
      level.addObject(sun);
      ICD.reset();
     }
   }
   else if(this.name == "Chomper"){
     if(ICD.done()){
      Zombie victim = getOneIntersectingObject(Zombie.class);
      
      if(victim != null){ //on hit
        victim.setHealth(victim.health - 999999);
        ICD.reset();
      }
     }
   }
   else if(this.name == "Squash"){
      Zombie victim = getOneIntersectingObject(Zombie.class);
      
      if(victim != null){ //on hit
        victim.setHealth(victim.health - 999999);
        level.removeObject(this);
      }
   }
   else if(this.name == "Potatomine"){
    if(ICD.done()){
      Zombie victim = getOneIntersectingObject(Zombie.class);
      
      if(victim != null){ //on hit
        victim.setHealth(victim.health - 999999);
        level.removeObject(this);
      }
    }
   }
   
   else if(this.name == "Cherrybomb"){
     
   }
   else if(this.name == "Wallnut" || this.name == "Tallnut"){
     
   }
 }


}

public class Peashooter extends Plant{
 public Peashooter(int x, int y){
   super("Peashooter",x,y,100,50,new Timer(60), PEA_PROJECTILE, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}
public class Sunflower extends Plant{ //needs to generate sun
 public Sunflower(int x, int y){
   super("Sunflower",x,y,100,50,new Timer(300), NO_SHOOT, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}

public class Twinsunflower extends Plant{
  public Twinsunflower(int x, int y){
       super("Twinsunflower",x,y,150,50,new Timer(150), NO_SHOOT, false, true); //50 health, 200 sun cost, Pea projectile 
  }
}
public class Cherrybomb extends Plant{ //needs to not shoot and explode
 public Cherrybomb(int x, int y){
   super("Cherrybomb",x,y,100,50,new Timer(60), NO_SHOOT, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}
public class Chomper extends Plant{ //needs to not shoot
 public Chomper(int x, int y){
   super("Chomper",x,y,100,50,new Timer(3600, true), NO_SHOOT, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}
public class Squash extends Plant{
  public Squash(int x, int y){
    super("Squash",x,y,100,100,new Timer(0), NO_SHOOT, false, true);
  }
}
public class Potatomine extends Plant{ //needs to not shoot
 public Potatomine(int x, int y){
   super("Potatomine",x,y,100,50,new Timer(60), NO_SHOOT, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}
public class cobCannon extends Plant{
  public cobCannon(int x, int y){
   super("cobCannon",x,y,500,250,new Timer(600), PEA_PROJECTILE, false, true);   
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
public class Wallnut extends Plant{ //needs to not shoot
 public Wallnut(int x, int y){
   super("Wallnut",x,y,100,150,new Timer(60), NO_SHOOT, false, true);
 }
}

public class Tallnut extends Plant{ //needs to not shoot
 public Tallnut(int x, int y){
   super("Tallnut",x,y,100,300,new Timer(60), NO_SHOOT, false, true);
 }
}
public class Torchwood extends Plant{ //needs to not shoot
 public Torchwood(int x, int y){
   super("Torchwood",x,y,100,50,new Timer(60), NO_SHOOT, false, true);
 }
}
public class FumeShroom extends Plant{
  public FumeShroom(int x, int y){
    super("FumeShroom",x,y,150,100,new Timer(60), NO_SHOOT, false, true);
  }
}
public class SunShroom extends Plant{
  public SunShroom(int x, int y){
    super("SunShroom",x,y,150,100,new Timer(360), NO_SHOOT, false, true);
  }
}
