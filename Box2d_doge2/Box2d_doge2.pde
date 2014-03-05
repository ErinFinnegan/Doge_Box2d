

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Mover> movers;

Box2DProcessing box2d;    


//Mover[] movers = new Mover[5];
PFont font;
PImage doge;
//color[] ArrayOfColors = { 
//  color(181, 230, 29), color(63, 72, 204), color(255, 174, 201), color(0, 162, 232), color(255, 127, 39), color(255, 242, 0), color(136, 0, 21), color(212, 176, 190), color(207, 209, 100), color(200, 120, 87)
//};
//String[] words = { 
//  "wow", "much processing", "very Java", "much codee", "very scare", "PVectro", "much force", "frictoin", 
//  "wow", "very Newton", "much law",
//};
//int index = int(random(words.length)); 
//color rgb;
int bounce;
//color rgb;


void setup() {
  size(1000, 750);
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();

  movers = new ArrayList<Mover>();

  millis();
  doge = loadImage("dogenowords2.jpg");
  font = loadFont("ComicSansMS-Bold-40.vlw");
  randomSeed(1);
  //  for (int i = 0; i < movers.length; i++) {
  //    movers[i] = new Mover(random(width), 0);
  //  }
  bounce = 0;
  //fill(ArrayOfColors[(int) random(ArrayOfColors.length)]);
//  rgb = (ArrayOfColors[(int) random(ArrayOfColors.length)]);
//  fill(rgb);
  //Pick one word and one color per word at random from my arrays and then use those words in the draw loop as movers
}

void draw() {
  background(255);
  image(doge, 0, 0);
  box2d.step();
  Mover p = new Mover(mouseX, mouseY);
  movers.add(p);

  for (int i = 0; i < movers.size(); i++) {
    //
    //    PVector wind = new PVector(1, 0);
    //    PVector gravity = new PVector(0, (1.0*movers[i].mass + (bounce/5)));
    //
    //    float c = 0.1;
    //    PVector friction = movers[i].velocity.get();
    //    friction.mult(-1.5); 
    //    friction.normalize();
    //    friction.mult(c);
    //
    //    movers[i].applyForce(friction);
    //    if (bounce > 50) {
    //      movers[i].applyForce(wind);
    //    };
    //    movers[i].applyForce(gravity);
    //
    //    movers[i].update();
    movers.get(i).display();
    //    movers[i].checkEdges();
  }
}

