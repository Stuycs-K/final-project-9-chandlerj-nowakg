public class DebugCamera extends Actor{

  Green green;
  
  public DebugCamera(){
   super(width/2, height/2, 5, 5);
   green = Green.getInstance();
   Green.getWorld().addObject(this); 
  }
  
  public void prepare(){
    
  }
  
  
  public void act(float deltaTime){
      if (green.isKeyDown(RIGHT)){
      moveGlobal(8, 0);
    }
    if (green.isKeyDown(LEFT)){
      moveGlobal(-8, 0);
    }
    if (green.isKeyDown(UP)){
      moveGlobal(0, -12);
    }
    if (green.isKeyDown(DOWN)){
      moveGlobal(0, 12);
    }
    if (green.isKeyDown('z')){
      System.out.println(getX() + ", " + getY());
    }
    
  }
  
  
}
