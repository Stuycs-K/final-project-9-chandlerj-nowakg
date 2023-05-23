import java.util.*;

public class Lawn{
  private static final int MENU = 0;
  private static final int DAY = 1;
  private static final int NIGHT = 2;
  private static final int POOL = 3;
  private static final int FOG = 4;
  private static final int ROOF = 5;
  
  int levelID;
  private static final int EMPTY = 0;
  private static final int OCCUPIED = 1;
  private int[][] lawn;
  
public Lawn(int ID){
  levelID = ID;
 
}

public boolean createLawn(){
  
  if(levelID == POOL || levelID == FOG){
    this.lawn = new int[][]{
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0},
      {1,1,1,1,1,1,1,1,1,1},
      {1,1,1,1,1,1,1,1,1,1},
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0}
    };
  }
  else{
    this.lawn = new int[][]{
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0}
    };
  }
    

}
public boolean isOccupied(int row, int col){
    if(lawn[row][col] == OCCUPIED){
       return false;
    }
    else{
      return true;
    }
}  

//divy map depending on the level
}
  
