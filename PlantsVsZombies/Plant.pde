public class Plant{
   String name;
   Timer ICD;
   int cost;
   int Health;
   PImage sprite;



public Plant(String name, int cost){
   this.name = name;
   this.cost = cost;
   this.sprite = loadImage(name+".jpg");
}


}
/*
public int getHealth(){
 return this.health; 
}

public int getCost(){
  return this.cost;
}
/* METHODS I ORIGINALLY INTENDED FOR PLANT BUT WOULD WORK BETTER IN LAWN


void placePlant(Plant plant, int xPos, int yPos){
  Plant[][] plantGrid = new Plant[5][10];
  for(int i = 0; i < size; i++){
   }
>>>>>>> lawnWork
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
<<<<<<< HEAD
  if(row > map.length && col < map[0].
  int placementX = (row*180)+90;
  int placementY = (col*360)+180;
  //if map[row][col] is vacant, place a plant there.  
  }
=======
  if(row > plantGrid.size() && col < plantGrid.get(0).size(){
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


>>>>>>> lawnWork
*/
