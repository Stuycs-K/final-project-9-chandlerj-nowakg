public class Projectile extends Actor{
  private int damage;
  private int[][]map;
  private PImage sprite;
  
  public Projectile(float x, float y, PImage image, float scaleMultiplier){
    this.damage = dmg;
    this.map = map;
    this.sprite = sprite;
    xPos = spawnX;
    yPos = spawnY;
  }
  
  public abstract void act(){
    while (this.getOneIntersectingObject == false){
      this.draw();
      xPos++;
      yPos++;
    }
  }
  public void dealDamage(){
   for(int i=spawnY; i < map.length; i++){
    if(map[spawnX][i] == ZOMBIE){
     Zombie victim = map[spawnX][i];
     victim.takeDamage(this.damage);
    }
   }
   this.die();
  }
