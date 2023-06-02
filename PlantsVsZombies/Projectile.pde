import java.util.*;
import java.lang.reflect.*;
public class Projectile extends Actor {
  private int damage;
  private PImage sprite;
  private int xPos;
  private int yPos;
  Green green;
  public Projectile(int spawnX, int spawnY, int dmg, PImage image) {
    super(spawnX,spawnY, loadImage("Sprites/Plants/" + image), 0.333333f);
    green = Green.getInstance();
    this.damage = dmg;
    this.sprite = image;
    xPos = spawnX;
    yPos = spawnY;
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
