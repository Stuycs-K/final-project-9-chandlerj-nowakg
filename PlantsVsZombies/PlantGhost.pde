public class PlantGhost extends Actor{
  PImage sprite;
  boolean inPlacement;
 public PlantGhost(PImage sprite){
  super(mouseX, mouseY, 100, 100);
  this.sprite = sprite;
  setImage(sprite);
  setOpacity(150);  
  setZ(20); //so it appears above plant seed slots
 }
 
 
 public void act(float deltaTime){
   if (inPlacement){
     setLocation(mouseX, mouseY); 
   }
   else{
    setLocation(-100f, -100f); 
   }
  
 }
}
