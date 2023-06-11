import java.util.*;
import Green.*;
private static final int MENU = 0;
private static final int DAY = 1;
private static final int NIGHT = 2;
private static final int POOL = 3;
private static final int FOG = 4;
private static final int ROOF = 5;



//in the order of the seedselect.jpg in the sprites flolder
public final String[] seeds = {"Peashooter", "Sunflower", "Cherrybomb", "Walnut", "Potatomine", "Snowpea", "Chomper", "Repeater",
                          "Puffshroom", "Sunshroom", "Fumeshroom", "Gravebuster", "Hypnoshroom", "Scaredyshroom", "Iceshroom", "Doomshroom",
                          "Lilypad", "Squash", "Threepeater", "Tanglekelp","Jalepeno", "Spikeweed", "Torchwood", "Tallnut", 
                          "Seashroom", "Plantern", "Cactus", "Blover", "Splitpea", "Starfruit", "Pumpkin", "Magnetshroom",
                          "Cabbagepult", "Flowerpot", "Kernelpult", "Coffeebean", "Garlic", "Umbrellaleaf", "Marigold", "Melonpult",
                          "Gatlingpea", "Twinsunflower", "Gloomshroom", "Cattail", "Wintermelon", "Goldmagnet", "Spikerock", "Cobcannon"};


Green green;
Level activeLevel;
int coins = 0;

void enterNextLevel() {
  if (activeLevel.levelID + 1 > 5) {
    changeLevel(MENU);
    return;
  }
  changeLevel(activeLevel.levelID + 1);
}


void changeLevel(int levelID) {
  Level newLevel;

  switch(levelID) {
    case(MENU):
    newLevel = new MainMenu();
    break;
    case(DAY):
    newLevel = new DayLevel();
    break;
    case(NIGHT):
    newLevel = new NightLevel();
    break;
    case(POOL):
    newLevel = new PoolLevel();
    break;
    case(FOG):
    newLevel = new FogLevel();
    break;
    case(ROOF):
    newLevel = new RoofLevel();
    break;
  default:
    newLevel = new MainMenu();
    System.out.println("error: levelID greater than 5, or less than 0 in changeLevel() (PlantsvsZombies) ");
  }

  activeLevel = newLevel;
  green.loadWorld(activeLevel);
}


void setup() {
  size(1280, 800);
  System.out.println("setup:  running level menu.");

  green = new Green(this);
  activeLevel = new MainMenu();
  green.loadWorld(activeLevel);
}

void draw() {
  green.handleAct();
  green.handleDraw();
  green.handleMousePosition(pmouseX, pmouseY, mouseX, mouseY);
  green.handleInput();
  //dont touch these 4

  //level stuff
  if (activeLevel.finished == true && activeLevel.levelID != MENU) {
    enterNextLevel();
  }

  if (green.isKeyDown('m')) {
    changeLevel(MENU);
  }
  if (green.isKeyDown('g')) {
    changeLevel(DAY);
  }
  if (green.isKeyDown('h')) {
    changeLevel(NIGHT);
  }
  if (green.isKeyDown('j')) {
    changeLevel(POOL);
  }
  if (green.isKeyDown('k')) {
    changeLevel(FOG);
  }
  if (green.isKeyDown('l')) {
    changeLevel(ROOF);
  }


  fill(255);
  text(frameRate, 40, 120);
}


// these control inputs dont touch these
void mousePressed()
{
  green.handleMouseDown(mouseButton);
}
void mouseReleased()
{
  green.handleMouseUp(mouseButton);
}
void mouseWheel(MouseEvent event)
{
  green.handleMouseWheel(event.getCount());
}
void keyPressed()
{
  green.handleKeyDown(key, keyCode);
}
void keyReleased()
{
  green.handleKeyUp(key, keyCode);
}
