import java.util.*;
private static final int MOWER = -5;
private static final int BOMBED = -4;
private static final int ROOFTILE = -3;
private static final int WATER = -2;
private static final int LILYPAD = -1;
private static final int SOIL = 0;
private static final int PLANT = 1;
private static final int PUMPKIN = 2;
/* METHODS I ORIGINALLY INTENDED FOR PLANT BUT WOULD WORK BETTER IN LAWN


void placePlant(Plant plant, int xPos, int yPos){
  int row = 0;
  int col = 0;
  while(xPos > 180){
      xPos -= 180;
      row++;
  }

  while(yPos > 360){
   yPos -= 360;
   col++;
  }
  if(row > map.length && col < map[0].
  int placementX = (row*180)+90;
  int placementY = (col*360)+180;
  //if map[row][col] is vacant, place a plant there.  
  }
  if(row > plantGrid.length && col < plantGrid[0].length{
  int placementX = (row*180)+90;
  int placementY = (col*360)+180;
  image(this.sprite,placementX,placementY);
  map[row][col] = OCCUPIED;
  //if map[row][col] is vacant, place a plant there.  
  }
  for(int i = 0; i < size; i++){
    for(int j=0; j < plantGrid.get(i).size(); j++){
      if(plantGrid.get(i).get(j).getHealth() == 0){
       plantGrid.get(i).remove(j); 
      }
      
    }
   }
}
*/
public class Lawn{
  private int[][] lawn;
  private Plant[][] plantGrid;
  int tileXSize;
  int tileYSize;
  
  
  public Lawn(int[][] levelLawn, Plant[][] incomingGrid){
    lawn = levelLawn;
    plantGrid = plantGrid;
    tileXSize = 1920 / lawn.length;
    tileYSize = 1040 / lawn[0].length;  
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
    //if plant is grounded, can't be placed on lilypads22
    //if plant is aquatic, can't be placed on SOIL or lilypad
    //if plant is a pumpkin, it can be placed on plants
    //if plant is a coffeebean, it can be placed on plants but wont update the number of lawn
  }  
}  
