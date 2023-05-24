public class NightLevel extends Level{
  public NightLevel(){
   super(2, loadImage("Sprites/main_menu_background.jpg"), 
   new Lawn (new int[][]{
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL}
    })
    
    );
 }
  
}
