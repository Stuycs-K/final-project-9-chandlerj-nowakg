public class PlantGhost extends Actor{
  PImage sprite;
 public PlantGhost(PImage sprite){
  super(mouseX, mouseY, 100, 100);
  this.sprite = sprite;
  setImage(sprite);
  setOpacity(80);
  
 }

 
 public void act(float deltaTime){
  setLocation(mouseX, mouseY); 
 }
}
