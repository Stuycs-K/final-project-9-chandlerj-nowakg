public class Collectable extends Actor{
  
  static final int  SUN = 0;
  static final int  SILVERCOIN = 1;
  static final int  GOLDCOIN = 2;
  static final int  DIAMOND = 3;
  static final int  MONEYBAG = 4;
  
  int value;
  Green green;
  
  
  public Collectable(float x, float y, PImage sp, int val){
    super(x, y, sp);
    value = val;
    Green.getWorld().addObject(this);
  }
  
  public int getValue(){
   return value; 
  }
  
  public void act(float deltaTime){
    System.out.println(getX() + "");
    if(this.isMouseButtonDownHere(LEFT)){
      //System.out.println("ive been clicked!");
      
    }
  }
    
}
    

public class Sun extends Collectable{
 public Sun(float x, float y, boolean fromSky){
   super(x, y, loadImage("Sprites/Collectables/sun.png"), 25);
 }
}

public class SilverCoin extends Collectable{
 public SilverCoin(float x, float y){
   super(x, y, loadImage("Sprites/Collectables/silvercoin.png"), 10);
 }
}
public class GoldCoin extends Collectable{
 public GoldCoin(float x, float y){
   super(x,y,loadImage("Sprites/Collectables/goldcoin.png"),50);
 }
}
public class Diamond extends Collectable{
 public Diamond(float x, float y){
   super(x,y,loadImage("Sprites/Collectables/diamond.png"),1000);
 }
}
public class MoneyBag extends Collectable{
 public MoneyBag(float x, float y, int val){
   super(x,y,loadImage("Sprites/Collectables/moneybag.png"),val);
 }
}
