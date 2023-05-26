public class MainMenu extends Level{
 public MainMenu(){
   super(0, loadImage("Sprites/main_menu_background.jpg"));
 }
  
  public void configure(){
    background.resize(1920,1040);
    image(background,0,0);
  }
  
  public void run(){
    mouseInput();
   return; //override just so it doens't do regular level stuff like spawning sun and zombies 
  }
   
  public void deload(){
    //get rid of all the buttons
   finished = true;
  }
  
  public boolean isFinished(){
    return true;
  }
  
  public void mouseInput(){
    if (userInput.isPressed(Controller.MOUSECLICK)){
        deload();
        changeLevel(DAY);
     }
  
}
}
