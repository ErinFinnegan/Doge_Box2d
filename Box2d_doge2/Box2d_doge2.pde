

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Mover> movers;

Box2DProcessing box2d;    


//Mover[] movers = new Mover[5];
PFont font;
PImage doge;
int bounce;



void setup() {
  size(1000, 750);
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();

  movers = new ArrayList<Mover>();

  millis();
  doge = loadImage("dogenowords2.jpg");
  font = loadFont("ComicSansMS-Bold-40.vlw");
  randomSeed(1);

  bounce = 0;
}

void draw() {
  background(255);
  image(doge, 0, 0);
  box2d.step();
  Mover p = new Mover(mouseX, mouseY);
  movers.add(p);

  for (int i = 0; i < movers.size(); i++) {

    movers.get(i).display();

  }
}

