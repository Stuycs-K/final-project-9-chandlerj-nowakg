import java.util.*;
private static final int MOWER = -5;
private static final int BOMBED = -4;
private static final int ROOFTILE = -3;
private static final int WATER = -2;
private static final int LILYPAD = -1;
private static final int SOIL = 0;
private static final int PLANT = 1;
private static final int PUMPKIN = 2;
public class Lawn{
  private int[][] lawn;
  int screenSize = 1100 * 600; 
  int tileXSize;
  int tileYSize;
  public Lawn(int[][] levelLawn){
    lawn = levelLawn;
    tileXSize = 1100 / lawn.length;
    tileYSize = 600 / lawn[0].length;  
  }

  public boolean placePlant(int row, int col){ //will have a Plant plant
    if (col <= 0 || col > lawn[0].length){
     return false; //its less than or equal to 0 because you can't place on a mower tile 
    }
    if (row < 0 || row > lawn.length){
     return false; 
    }
  
    return true;
    //check based on plant's info
    //if plant is grounded, can't be placed on lilypads
    //if plant is aquatic, can't be placed on SOIL or lilypad
    //if plant is a pumpkin, it can be placed on plants
    //if plant is a coffeebean, it can be placed on plants but wont update the number of lawn
}  

}
