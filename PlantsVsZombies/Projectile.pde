import java.util.*;
import java.lang.reflect.*;
public class Projectile extends Actor {
  private int damage;
  private PImage sprite;
  private boolean armed;
  private float speed;
  Green green;
  
  public Projectile(Projectile template){
    this(template.damage,template.speed,template.getImage());
  }
  
  
  
  public Projectile(int dmg, float speed, PImage image) {
    super(width/2,20, image, 0.333333f); //these shouldn't be touching the edge nor should they be touching the first lawn row
    green = Green.getInstance();
    this.damage = dmg;
    this.sprite = image;
    this.speed = speed;
    armed = false;
  }
  
  public void arm(int xPos, int yPos){
   setX(xPos);
   setY(yPos);
   armed = true;
  }
  

  //will change depending on the plant but for now, let's just assume its a peashooter
  public void act(float deltaTime){
    if (armed){
       if(isAtEdge()){
        getWorld().removeObject(this);
        return; //Since this no longer 'exists'
      }
      
      //Check for whether a zombie has been hit
    
      Zombie victim = getOneIntersectingObject(Zombie.class);
      
      if(victim != null){ //on hit
        victim.setHealth(victim.health - damage);
        getWorld().removeObject(this);
      }

      move(speed);
      
    } 
   }
  }
 
 public class Pea extends Projectile{
  public Pea(){
   super(20, 10, loadImage("Sprites/Collectables/sun.png")); //it does 20 damage. speed of 10
  }
   
 }
