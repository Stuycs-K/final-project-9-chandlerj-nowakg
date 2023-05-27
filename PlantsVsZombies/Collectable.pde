public class Collectable{
  
  static final int SUN = 0;
  static final int  SILVERCOIN = 1;
  static final int  GOLDCOIN = 2;
  static final int  DIAMOND = 3;
  static final int  MONEYBAG = 4;
  
  PImage sprite;
  float xLoc;
  float yLoc;
  int clickRadius;
  Controller userInput = new Controller();
  
  
  
  public Collectable(PImage sp){
    sprite = sp;
  }
  
  
   public void spawn(int x, int y, int size){
    xLoc = (float) x;
    yLoc = (float) y;
    clickRadius = size;
    circle((float) xLoc, (float) yLoc, (float) clickRadius);
    image(sprite, xLoc, yLoc);
  }
  
  
    
    
    //if ((mouseX <= xLoc + clickRadius && mouseX >= xLoc -clickRadius) && (mouseY <= yLoc + clickRadius && mouseY >= yLoc - clickRadius)){
   //  System.out.println("clicked!"); 
   // }
  }
    

public class Sun extends Collectable{
 public Sun(boolean fromSky){
   super(loadImage("Sprites/Collectables/sun.png"));
 }
}

public class SilverCoin extends Collectable{
 public SilverCoin(){
   super(loadImage("Sprites/Collectables/silvercoin.png"));
 }
}
public class GoldCoin extends Collectable{
 public GoldCoin(){
   super(loadImage("Sprites/Collectables/goldcoin.png"));
 }
}
public class Diamond extends Collectable{
 public Diamond(){
   super(loadImage("Sprites/Collectables/Diamond.png"));
 }
}
public class MoneyBag extends Collectable{
 public MoneyBag(){
   super(loadImage("Sprites/Collectables/Moneybag.png"));
 }
}
