public class Camera extends Actor{

  Green green;
  
  public Camera(){
   super(width/2, height/2, 0, 0);
   green = Green.getInstance();
   Green.getWorld().addObject(this); 
  }
  
  public void prepare(){
    
  }
  
  
  public void act(float deltaTime){
    if (green.isKeyDown(RIGHT) && getX() + width/2 < Green.getWorld().getWidth()){
      moveGlobal(8, 0);
    }
    if (green.isKeyDown(LEFT) && getX() > width/2){
      moveGlobal(-8, 0);
    }
  }
  
  
}
