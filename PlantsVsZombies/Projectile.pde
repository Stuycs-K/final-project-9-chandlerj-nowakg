public class Projectile extends Actor{
  private int damage;
  private PImage sprite;
    public Projectile(float x, float y, PImage image, int dmg){
    super(x, y, image);
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
 
 public class Pea extends Projectile{
  public Pea(float x, float y){
   super(x, y, loadImage("ENTER IMAGE HERE"), 20); //it does 20 damage. 
  }
   
 }
