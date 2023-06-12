import java.util.*;
import java.lang.reflect.*;
private static final int MOWER = -5;
private static final int BOMBED = -4;
private static final int ROOFTILE = -3;
private static final int WATER = -2;
private static final int SOIL = 0;
private static final int LILYPAD = 1;
private static final int PLANT = 2;
private static final int PUMPKIN = 3;
private static final int[] topLeftCoord = {90, 100}; //includes mowers
private static final int[] bottomRightCoord = {1220, 755};

public class Lawn{
  Level level = (Level) Green.getWorld();
  private int[][] originalLawn;
  public int[][] lawn;
  int tileXSize;
  int tileYSize;
  
  int gameState = 0; //gets set by level, not the best way of doing things but it works
  
  public Lawn(int[][] levelLawn){
    originalLawn = levelLawn; //dont change this one because this will be the reference that it will go back to when a plant is killed 
    lawn = levelLawn; 
    tileXSize = (bottomRightCoord[0] - topLeftCoord[0]) / lawn[0].length;
    tileYSize = (bottomRightCoord[1] - topLeftCoord[1]) / lawn.length; 
  }
  
  
  public boolean placePlant(String name, int x, int y, boolean mouse){
    if (y - topLeftCoord[1] < 0){
     return false; 
    }
    if (mouse) return placePlant(name, (y - topLeftCoord[1]) / tileYSize, (x  - topLeftCoord[0])/ tileXSize);
    else return placePlant(name, x, y);
  }
  

  private boolean placePlant(String name, int row, int col){    
    if (gameState != level.INVASION && !name.equals("Lawnmower")){
       return false;     
     }
    if (col < 0 || col >= lawn[0].length){
     return false; 
    }
    if (col == 0 && !name.equals("Lawnmower")){
     return false; //equal to 0 because you can't place on a mower tile 
    }
    if (row < 0 || row >= lawn.length){ //row can be 0, col cannot
     return false; 
    }
    if ((lawn[row][col] == PLANT || lawn[row][col] == LILYPAD) && !name.equals("pumpkin")){
     return false; 
    }
    
    int placementX = col * tileXSize + (int) topLeftCoord[0] + tileXSize / 2;
    int placementY = row * tileYSize + (int) topLeftCoord[1] + tileYSize / 2;
    
    Plant plant;
    
    System.out.println(name);
    
    if (name.equals("Lawnmower")){
     plant = new Lawnmower(placementX, placementY); 
     lawn[row][col] = MOWER;
    }
    else if (name.equals("Peashooter")){
     plant = new Peashooter(placementX, placementY); 
     lawn[row][col] = PLANT;
    }
    else if (name.equals("Sunflower")){
      plant = new Sunflower(placementX, placementY); 
      lawn[row][col] = PLANT;
    }
    else if(name.equals("Twinsunflower")){
     plant = new Twinsunflower(placementX, placementY); 
    }
    else if(name.equals("Squash")){
     plant = new Squash(placementX, placementY); 
    }
    else if(name.equals("Fumeshroom")){
       plant = new Fumeshroom(placementX, placementY); 
    }
    else if(name.equals("Puffshroom")){
       plant = new Squash(placementX, placementY); 
    }
    else if(name.equals("Sunshroom")){
       plant = new Sunshroom(placementX, placementY); 
    }
    else if (name.equals("Cherrybomb")){
      plant = new Cherrybomb(placementX, placementY);
      lawn[row][col] = PLANT;
    }
    else if(name.equals("Cobcannon")){
      plant = new Cobcannon(placementX, placementY); 
    }
    else if(name.equals("Spikerock")){
      plant = new Spikerock(placementX, placementY); 
    }
    else if(name.equals("Spikeweed")){
      plant = new Spikeweed(placementX, placementY); 
    }
    else if (name.equals("Chomper")){
      plant = new Chomper(placementX, placementY); 
      lawn[row][col] = PLANT;
    }
    else if (name.equals("Walnut")){
      plant = new Walnut(placementX, placementY); 
      lawn[row][col] = PLANT;
    }
    else if (name.equals("Snowpea")){
      plant = new Snowpea(placementX, placementY); 
      lawn[row][col] = PLANT;
    }
    else if (name.equals("Potatomine")){
      plant = new Potatomine(placementX, placementY); 
      lawn[row][col] = PLANT;
    }
    else if (name.equals("Repeater")){
      plant = new Repeater(placementX, placementY); 
      lawn[row][col] = PLANT;
    }
    else if(name.equals("Wallnut")){
      plant = new Walnut(placementX, placementY); 
    }
    else if(name.equals("Tallnut")){
      plant = new Tallnut(placementX, placementY); 
    }
    else if(name.equals("Gatlingpea")){
     plant = new Gatlingpea(placementX, placementY); 
    }
    else if(name.equals("Blover")){
      plant = new Blover(placementX,placementY);
    }
    else if(name.equals("Cactus")){
     plant = new Cactus(placementX,placementY); 
    }
    else if(name.equals("Marigold")){
      plant = new Marigold(placementX,placementY);
    }
    else{
      plant = new Peashooter(placementX, placementY);
      lawn[row][col] = PLANT;
      System.out.println("Error name isn't an actual plant name");
    }

   
   
   return true;
    //check based on plant's info
    //if plant is grounded, can't be placed on lilypads
    //if plant is aquatic, can't be placed on SOIL or lilypad
    //if plant is a pumpkin, it can be placed on plants
    //if plant is a coffeebean, it can be placed on plants but wont update the number of lawn
    
  }
  
  
}  
