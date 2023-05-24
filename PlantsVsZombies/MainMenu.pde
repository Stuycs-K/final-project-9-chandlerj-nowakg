public class MainMenu extends Level{
 public MainMenu(){
   super(0, loadImage("Sprites/main_menu_background.jpg"));
 }
  
  
  public void configure(){
    image(background,0,0);
    //create all the buttons
  }
  
  public void run(){
   return; //override just so it doens't do regular level stuff like spawning sun and zombies 
  }
   
  public void deload(){
    //get rid of all the buttons
   finished = true;
  }
  
  public boolean isFinished(){
    return true;
  }
  
  public void mouseClicked(){
    //if on a button or something...
    deload();
    System.out.println(" " + activeLevel.getID());
    changeLevel(DAY);
  }
  
}
