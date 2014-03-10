

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Mover> movers;

Box2DProcessing box2d;    

Boundary wall;
float wheredamouseatX, wheredamouseatY, wheredamouseat;;
PFont font;
PImage doge;
int bounce;
int time;



void setup() {
  size(1000, 750);
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();

  movers = new ArrayList<Mover>();

  millis();
  doge = loadImage("dogenowords2.jpg");
  font = loadFont("ComicSansMS-Bold-40.vlw");
  randomSeed(1);

  bounce = 2;
  millis();
  time = 0;
  wall = new Boundary(width/2, height-5, width, 60);
  wheredamouseat = 0;
  wheredamouseatX = 0;
  wheredamouseatY = 0;
}

void draw() {
  background(255);
  image(doge, 0, 0);
  box2d.step();
  time = millis();
  //println(time);


  for (int i = 0; i < movers.size(); i++) {

    movers.get(i).display();
  }

  wall.display();
}

void mousePressed() {
  
  Mover p = new Mover(mouseX, mouseY, 20);
  movers.add(p);
// println("mouseX " + mouseX, " mouseY " + mouseY, " wheredamouseatX " + wheredamouseatX, " wheredamouseatY " + wheredamouseatY);
}


