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
        changeLevel(DAY);
     }
  }
   
  
  public boolean isFinished(){
    return true;
  }
  
}
