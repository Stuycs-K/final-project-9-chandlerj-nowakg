public class Projectile{
  private int damage;
  private int[][]map;
  private int xPos;
  private int yPos;
  private PImage sprite;
  
  public Projectile(int dmg, int[][] map, int spawnX, int spawnY, PImage sprite){
    this.damage = dmg;
    this.map = map;
    this.sprite = sprite;
    xPos = spawnX;
    yPos = spawnY;
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
  
  public void die(){
    
  }
    
