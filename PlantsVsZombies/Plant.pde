public class Plant{
   String name;
   int cost;
   PImage sprite;



public Plant(String name, int cost){
   this.name = name;
   this.cost = cost;
   this.sprite = loadImage(name+".jpg");
}



}
/*
void placePlant(Plant plant, int xPos, int yPos){
  List<List<Plant>> plantGrid = new ArrayList<List<Plant>>(size); 
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
*/
