  public class Collectable extends Actor {

  static final int  SUN = 0;
  static final int  SILVERCOIN = 1;
  static final int  GOLDCOIN = 2;
  static final int  DIAMOND = 3;
  static final int  MONEYBAG = 4;

  int value;
  Green green;
  Level level = (Level) Green.getWorld();

  public Collectable(float x, float y, PImage sp, int val) {
    super(x, y, sp);
    value = val;
  }

  public int getValue() {
    return value;
  }

  public void act(float deltaTime) {
    if (this.isMouseButtonDownHere(LEFT)) {
      //System.out.println("ive been clicked!");
    }
  }
}

public class Sun extends Collectable {
  boolean fromSky;
  int yFloor = 20;
  Random seed;
  int gameHeight = Green.getWorld().getHeight();

  public Sun(float x, float y, boolean sky, Random s) {
    super(x, y, loadImage("Sprites/Collectables/sun.png"), 25);
    fromSky = sky;
    seed = s;
    yFloor = gameHeight - 100 - seed.nextInt(gameHeight * 2 / 3); //added the -100 so sun doesn't fall on the very very bottom
  }

  public void act(float deltaTime) {
    if (fromSky && getY() < yFloor) {
      moveGlobal(0, 8);
    }
    if (this.isMouseButtonDownHere(LEFT)) {
      level.sun += 25;  
      level.removeObject(this);
    }
  }
}

public class SilverCoin extends Collectable {
  public SilverCoin(float x, float y) {
    super(x, y, loadImage("Sprites/Collectables/silvercoin.png"), 10);
  }
}
public class GoldCoin extends Collectable {
  public GoldCoin(float x, float y) {
    super(x, y, loadImage("Sprites/Collectables/goldcoin.png"), 50);
  }
}
public class Diamond extends Collectable {
  public Diamond(float x, float y) {
    super(x, y, loadImage("Sprites/Collectables/diamond.png"), 1000);
  }
}
public class MoneyBag extends Collectable {
  public MoneyBag(float x, float y, int val) {
    super(x, y, loadImage("Sprites/Collectables/moneybag.png"), val);
  }
}
