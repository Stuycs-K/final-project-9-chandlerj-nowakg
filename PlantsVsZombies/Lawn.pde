import java.util.*;
public class Lawn{
  private int[][] map;
  private static final int MODE = 1;
  private static final int EMPTY = 0;
  private static final int OCCUPIED = 1;
}

public boolean createLawn(){
  int screenSize = 1800 * 1800;
  int squareDimensions = 1800/ 
  
  if(MODE == 4){
    this.map = new int[][]{
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0},
      {1,1,1,1,1,1,1,1,1,1},
      {1,1,1,1,1,1,1,1,1,1},
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0}
    };
  }
  else{
    this.map = new int[][]{
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0},
      {1,1,1,1,1,1,1,1,1,1},
      {1,1,1,1,1,1,1,1,1,1},
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0}
    };
  }
    

}
public boolean isOccupied(int row, int col){
    if(map[row][col] == OCCUPIED){
       return false;
    }
    else{
      return true;
    }
}  

//divy map depending on the level
