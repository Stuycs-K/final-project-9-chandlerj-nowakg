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
private static final int[] topLeftCoord = {30, 110}; //includes mowers
private static final int[] bottomRightCoord = {1130, 750};

public class Lawn{
  private int[][] originalLawn;
  public int[][] lawn;
  int tileXSize;
  int tileYSize;
  
  
  public Lawn(int[][] levelLawn){
    originalLawn = levelLawn; //dont change this one because this will be the reference that it will go back to when a plant is killed 
    lawn = levelLawn; 
    tileXSize = (bottomRightCoord[0] - topLeftCoord[0]) / lawn[0].length;
    tileYSize = (bottomRightCoord[1] - topLeftCoord[1]) / lawn.length; 
  }
  
  
  public boolean placePlant(String name, int x, int y, boolean mouse){
    if (mouse) return placePlant(name, (y - topLeftCoord[1]) / tileYSize, (x  - topLeftCoord[0])/ tileXSize);
    else return placePlant(name, x, y);
  }
  

  private boolean placePlant(String name, int row, int col){ 
    System.out.println(" x? " + row );
   System.out.println(" y? " + col); 

    if (col <= 0 || col >= lawn[0].length){
     return false; //its less than or equal to 0 because you can't place on a mower tile 
    }
    if (row < 0 || row >= lawn.length){ //row can be 0, col cannot
     return false; 
    }
    if ((lawn[row][col] == PLANT || lawn[row][col] == LILYPAD) && !name.equals("pumpkin")){
     return false; 
    }
  

    
    float placementX = col * tileXSize + topLeftCoord[0] + 0.5 * tileXSize;
    float placementY = row * tileYSize + topLeftCoord[1] + 0.5 * tileYSize;
    
    System.out.println("x tile " + tileXSize);
    System.out.println("y tile " + tileYSize);
    System.out.println("placementX " + placementX);
    System.out.println("placementY " + placementY);
   /* 
    try{
     // Constructor<Peashooter> construct = Peashooter.class.getConstructor(float.class, float.class);
      //System.out.println(construct);
      //Plant plant = construct.newInstance(placementX, placementY);
      //Plant plant = (Plant) Class.forName("PlantsVsZombies$" + name).getDeclaredConstructor(float.class, float.class).newInstance(placementX, placementY);   //this here is some java sorcery known as reflection, i hope this doens't crash the computer or something
      
     
    Class cls = Class.forName("PlantsVsZombies$" + name);
    Constructor constructor = cls.getDeclaredConstructor(float.class, float.class);
    Plant plant = (Plant) constructor.newInstance(0.5f, 0.5f);
      
      plant.spawn();
    }  catch (InstantiationException e){
     e.printStackTrace();
    } catch (IllegalAccessException e){
     e.printStackTrace();
    } catch (NoSuchMethodException e){
      e.printStackTrace();
    } catch (InvocationTargetException e){
      e.printStackTrace();
    }catch (ClassNotFoundException e){
      e.printStackTrace();
    }
    */
    Plant plant = new Peashooter(placementX, placementY);
    Green.getWorld().addObject(plant); 
    lawn[row][col] = PLANT;
    
    
    //check based on plant's info
    //if plant is grounded, can't be placed on lilypads
    //if plant is aquatic, can't be placed on SOIL or lilypad
    //if plant is a pumpkin, it can be placed on plants
    //if plant is a coffeebean, it can be placed on plants but wont update the number of lawn
    return true;
  }
  
  
}  
