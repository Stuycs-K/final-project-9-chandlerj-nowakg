public class SeedSlot extends Actor{
 
  Timer timer;
  
  public SeedSlot(int x, int y, int cost, int cd, PImage sprite){
    super(x, y, sprite);
    timer = new Timer(cd);
  }
  
  
  public void act(float deltaTime){
    if (isMouseButtonDownHere(LEFT) && timer.done() == true){
      //send the plant
      timer.reset();
    }
  }
  
}
