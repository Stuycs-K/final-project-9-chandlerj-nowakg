public class MainMenu extends Level{
 public MainMenu(){
   super(0, loadImage("Sprites/main_menu_background.jpg"));
 }
  
  public void prepare(){
    background.resize(1920,1040);
    image(background,0,0);
  }
  
  public void act(float deltaTime){
    if (green.isMouseButtonDown(LEFT)){
        deload();
        changeLevel(DAY);
     }
  }
   
  public void deload(){
    //get rid of all the buttons
   finished = true;
  }
  
  public boolean isFinished(){
    return true;
  }
  
}
