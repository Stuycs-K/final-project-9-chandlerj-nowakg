public class Collectable{
  Random seed;
  PImage sprite;
  int xLoc;
  int yLoc;
  int clickRadius;
  Controller userInput = new Controller();
  
  
  public Collectable(Random sd, PImage sp){
    seed = sd;
    sprite = sp;
  }
  
  
   public void spawn(int x, int y, int size){
    xLoc = x;
    yLoc = y;
    clickRadius = size;
    circle((float) xLoc, (float) yLoc, (float) clickRadius);
  }
  
  
    
    
    //if ((mouseX <= xLoc + clickRadius && mouseX >= xLoc -clickRadius) && (mouseY <= yLoc + clickRadius && mouseY >= yLoc - clickRadius)){
   //  System.out.println("clicked!"); 
   // }
  }



public class Coin extends Collectable{
 public Coin(Random sd, PImage sp){
   super(sd, sp);
 }
}
public class Sun extends Collectable{
 public Sun(Random sd, PImage sp){
   super(sd, sp);
 }
}
