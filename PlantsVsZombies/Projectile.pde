import java.util.*;
import java.lang.reflect.*;
public class Projectile extends Actor {
  private int damage;
  private PImage sprite;
  private boolean armed;
  private float speed;
  Green green;
  World level;
  
  
  
  public Projectile(Projectile template){
    this(template.damage,template.speed,template.getImage());
  }
  
  
  
  public Projectile(int dmg, float speed, PImage image) {
    super(width/2,20, image); //these shouldn't be touching the edge nor should they be touching the first lawn row
    //System.out.println(""+ image.width);
    green = Green.getInstance();
    this.damage = dmg;
    this.sprite = image;
    this.speed = speed;
    armed = false;
    level = Green.getWorld();
  }
  
  
  public void arm(int xPos, int yPos){
   setX(xPos);
   setY(yPos);
   armed = true;
  }
  
  public boolean isArmed(){
   if(armed){
    return true; 
   }
   else{
     return false;
   }
  }
  public float getSpeed(){
    return speed;
  }
  public int getDamage(){
    return damage;
  }

  //will change depending on the plant but for now, let's just assume its a peashooter
  public void act(float deltaTime){
    if (armed){
       if(isAtEdge()){
        level.removeObject(this);
        return; //Since this no longer 'exists'
      }
      
      //Check for whether a zombie has been hit
    
      Zombie victim = getOneIntersectingObject(Zombie.class);
      
      if(victim != null){ //on hit
        victim.setHealth(victim.health - damage);
        level.removeObject(this);
      }

      move(speed);
    } 
   }
  }
 
 public class Pea extends Projectile{
  public Pea(){
   super(10, 10, loadImage("Sprites/Projectiles/Pea.png")); //it does 10 damage. speed of 10
  }
 }
 
 public class IcePea extends Projectile{
   public IcePea(){
     super(10,10,loadImage("Sprites/Projectiles/SnowPea.png"));
   }
 }
  public class FirePea extends Projectile{
  public FirePea(){
   super(20, 10, loadImage("Sprites/Projectiles/FirePea.png")); //it does 20 damage. speed of 10
  }
 }
 
 public class noProjectile extends Projectile{
   public noProjectile(){
     super(0,0,loadImage("Sprites/Projectiles/noProjectile.png"));
   }
 }
 
 public class Spore extends Projectile{
  int hitcount;
  public Spore(){
    super(30,10,loadImage("Sprites/Projectiles/Spore.png"));
    hitcount = 2;
  }
  @Override
  public void act(float deltaTime){
    if(hitcount == 0){
     level.removeObject(this); 
    }
    if (isArmed()){
       if(isAtEdge()){
        level.removeObject(this);
        return; //Since this no longer 'exists'
      }
      
      //Check for whether a zombie has been hit
    
      Zombie victim = getOneIntersectingObject(Zombie.class);
      
      if(victim != null){ //on hit
        victim.setHealth(victim.health - this.getDamage());
        hitcount--;
      }

      move(this.getSpeed());
    } 
  }
 }
