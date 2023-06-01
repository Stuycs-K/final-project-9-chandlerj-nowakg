public class Projectile extends Actor{
  private int damage;
  private int[][]map;
  private PImage sprite;
  
  public Projectile(float x, float y, PImage image){
    this.damage = dmg;
    this.map = map;
    this.sprite = sprite;
    xPos = spawnX;
    yPos = spawnY;
  }
  
  //will change depending on the plant but for now, let's just assume its a peashooter
  public abstract void act(){
    while (this.getOneIntersectingObject(Zombie) == false){
      xPos+=10;
    }
   Zombie victim = this.getOneObjectAtOffset(Zombie);
   victim.setHealth(victim.health - damage);
   getWorld().removeObject(this);
  }
 }
