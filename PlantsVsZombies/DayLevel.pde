public class DayLevel extends Level{
 public DayLevel(){
    super(1, loadImage("Sprites/Frontyard.jpg"), 
    new Lawn(
    new int[][]{
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL},
      {MOWER,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL,SOIL}
    })
    );
 }
}
