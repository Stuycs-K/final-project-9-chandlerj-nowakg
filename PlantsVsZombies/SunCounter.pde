public class SunCounter extends Actor{
  Level level;
 SunCounter(Level level){
  super(0, 0, width, 40);
  setZ(5); 
  this.level = level;
 }
 
 void act(float deltaTime){
   System.out.println("hi");
   draw();
 };
 
 public void draw(){ //override to make text work and shit
 System.out.println("hello");
 noStroke();
   textSize(64);
   fill(153);
    text("" + level.sun, 222, 64);
 }
}
