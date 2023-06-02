import java.util.*;
import java.lang.reflect.*;
public class Projectile extends Actor {
  private int damage;
  private PImage sprite;
  Green green;
  
  public Projectile(Projectile template){
    this(template.damage, template.getImage());
  }
  
  
  
  public Projectile(int dmg, PImage image) {
    super(width/2,20, image, 0.333333f); //these shouldn't be touching the edge nor should they be touching the first lawn row
    green = Green.getInstance();
    this.damage = dmg;
    this.sprite = image;
  }

  //will change depending on the plant but for now, let's just assume its a peashooter
  public void act(float deltaTime){
    
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

      
    }
    
  }
 
 public class Pea extends Projectile{
  public Pea(){
   super(20, loadImage("Sprites/Collectables/sun.png")); //it does 20 damage. 
  }
   
 }
