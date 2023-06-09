public class MainMenu extends Level{
 public MainMenu(){
   super(0, loadImage("Sprites/main_menu_background.jpg"));
 }
  
  public void prepare(){
    //background.resize(1920,1040); this was causing huge frame drops... might be something to look into...
    //image(background,0,0);
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
