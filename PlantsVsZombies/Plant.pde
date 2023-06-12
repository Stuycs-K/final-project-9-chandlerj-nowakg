import java.lang.reflect.*;
public class Plant extends Actor{
   static final int NO_SHOOT = -1;
   static final int PEA_PROJECTILE = 0;
   static final int SNOW_PEA_PROJECTILE = 1;
   static final int FIRE_PEA_PROJECTILE = 2;
   static final int SPORE_PROJECTILE = 3;
   static final int CORN_NUKE = 4;
   static final int INVISIBLE_PROJECTILE = 5;
   static final int SPIKE_PROJECTILE = 6;
   
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

public void shoot(){
   Projectile x = new Projectile(level.projectileTemplates[projectileID]);
     level.addObject(x);
     x.setZ(-10); //so it looks to be behind the peashooter and comes out of its mouse
     x.arm((int) getX(), (int) getY() - 20); //so it lines up with the opening of the peashooter a lil more
     ICD.reset();
   }
   
public void act(float deltaTime){
  if(health <= 0){
    level.removeObject(this);
   }
  
  if (ICD.done() == true && projectileID != NO_SHOOT){
     shoot();  
  }
  if(this.name == "Sunflower" || this.name == "Twinsunflower" || this.name == "Sunshroom"){
     if(ICD.done()){
       float z = this.getX();
       Random seed = new Random();
       z += seed.nextInt(10); //so there's a little variation on where it spawns from the sky and from the plant 
      Collectable sun = new Sun(z, this.getY(), false, seed);
      level.addObject(sun);
      ICD.reset();
     }
   }
   
   else if(this.name == "Marigold"){
     if(ICD.done()){
       Collectable y;
       float z = this.getX();
       int x = (int) (Math.random()*4) + 1;
       if(x == 1){
         y = new SilverCoin(z, this.getY());
       }
       else if(x==2){
         y = new GoldCoin(z, this.getY());
       }
       else if(x==3){
         y = new Diamond(z, this.getY());
       }
       else{
         y = new MoneyBag(z,this.getY(),500);
       }
      level.addObject(y);
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
        this.sprite = loadImage("Sprites/Plants/PotatomineEXPLOSION.png");
        delay(1500);
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
   super("Sunflower",x,y,100,50,new Timer(300), NO_SHOOT, false, true); //50 health, 100 sun cost, Pea projectile 
 }
}

public class Twinsunflower extends Plant{
  public Twinsunflower(int x, int y){
       super("Twinsunflower",x,y,150,50,new Timer(150), NO_SHOOT, false, true); //50 health, 200 sun cost, Pea projectile 
  }
}
public class Cactus extends Plant{
  public Cactus(int x, int y){
    super("Cactus",x,y,125,100,new Timer(60), SPIKE_PROJECTILE, false, true);
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
public class Cobcannon extends Plant{
  public Cobcannon(int x, int y){
   super("Cobcannon",x,y,500,250,new Timer(600), CORN_NUKE, false, true);   
  }
}
public class Repeater extends Plant{
  public Repeater(int x, int y){
    super("Repeater",x,y,100,50,new Timer(30),PEA_PROJECTILE, false, true);
  }
}

public class Gatlingpea extends Plant{
  public Gatlingpea(int x, int y){
    super("Gatlingpea", x,y,100,50,new Timer(20), PEA_PROJECTILE, false, true);
  }
}
public class Snowpea extends Plant{
 public Snowpea(int x, int y){
   super("Snowpea",x,y,100,50,new Timer(60), SNOW_PEA_PROJECTILE, false, true);
 }
}
public class Walnut extends Plant{ //needs to not shoot
 public Walnut(int x, int y){
   super("Walnut",x,y,100,150,new Timer(60), NO_SHOOT, false, true);
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
public class Fumeshroom extends Plant{
  public Fumeshroom(int x, int y){
    super("Fumeshroom",x,y,150,100,new Timer(60), SPORE_PROJECTILE, false, true);
  }
}
public class Puffshroom extends Plant{
  public Puffshroom(int x, int y){
   super("Puffshroom",x,y,0,30,new Timer(30), SPORE_PROJECTILE,false,true); 
  }
}
public class Sunshroom extends Plant{
  public Sunshroom(int x, int y){
    super("Sunshroom",x,y,150,100,new Timer(360), NO_SHOOT, false, true);
  }
}
public class Spikeweed extends Plant{
  public Spikeweed(int x, int y){
    super("Spikeweed",x,y,50,1000000, new Timer(20), NO_SHOOT, false, true);
  }
}
public class Spikerock extends Plant{
  public Spikerock(int x, int y){
    super("Spikerock",x,y,125,1000000, new Timer(20), NO_SHOOT, false, true);
  }
}
public class Blover extends Plant{
  public Blover(int x, int y){
    super("Blover",x,y,125,100, new Timer(120), PEA_PROJECTILE, false ,true);
  }
}

public class Marigold extends Plant{
  public Marigold(int x, int y){
    super("Marigold",x,y,50,50, new Timer(300), NO_SHOOT, false, true);
  }
}
