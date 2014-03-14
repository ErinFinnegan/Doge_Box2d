class Mover {

  Body body;
  float w =  random(9, 20);
  float h = random(9, 20);
  float r;
  int lifespan = 3000 - time;

  //  String[] words = { 
  //    "wow", "much processing", "very Java", "much codee", "very scare", 
  //    "wow", "box2d", "toxilibs", "very fixture", "much bounce",
  String[] superlatives = {
    "such", "very", "wow", "lol", "much"
  };
  String[] subjects = {
    "box2d", "shiffman", "boids", "physics", "processing", "box2d", "scare", "H-E-L-P", "math", "libraries", "homewokr"
  };


  int superlativeIndex = int(random(superlatives.length));
  int subjectIndex = int(random(subjects.length));
  // find the length of the created phrase
  // int totalLength = subjectIndex(of string) + superlativeIndex(of string)


  color[] ArrayOfColors = { 
    color(181, 230, 29), color(63, 72, 204), color(255, 174, 201), color(0, 162, 232), color(255, 127, 39), color(255, 242, 0), color(136, 0, 21), color(212, 176, 190), color(207, 209, 100), color(200, 120, 87)
  };
  color rgb = (ArrayOfColors[(int) random(ArrayOfColors.length)]); 
  int fontSize = int(random(20, 50));
  //  for (int s = 0 ; s<10; s++) {
  //    // int superlativeIndex = int(random(superlatives.length));
  //    // int subjectIndex = int(random(subjects.length));
  //    println(superlatives[superlativeIndex] + " " + subjects[subjectIndex]);
  //  }
  //}
  Mover(float x, float y, float r_) {
    r = r_;
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w);
    float box2dH = box2d.scalarPixelsToWorld(h);  // Box2D considers the width and height of a
    ps.setAsBox(box2dW, box2dH);            // rectangle to be the distance from the

    float box2dFS = box2d.scalarPixelsToWorld(fontSize);
    int(fontSize);
    // center to the edge (so half of what we
    // normally think of as width or height.) 
    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    // Parameters that affect physics
    fd.density = 0.1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Attach Fixture to Body               
    body.createFixture(fd);
    lifespan = 3000;
  }


  void display() {
    // if (isDead == false) {
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    wheredamouseat = fontSize;

    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();


    //    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    textFont(font, fontSize);
    rotate(-a);
    noStroke();
    fill(rgb);
    text(((superlatives[superlativeIndex] + " " + subjects[subjectIndex])), w, h);
    int length1 = superlatives[superlativeIndex].length();
    int length2 = subjects[subjectIndex].length();
    int length3 = length1 + length2;
    println("fontSize = " + fontSize, " w = " + w, " h = " + h, " length3 = " + length3);
    rect(0, 0, fontSize, length3);
    popMatrix();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan >= 3000) {
      return true;
    } 
    else {
      return false;
    }
  }

  void makeBody(Vec2 center, float w_, float h_) {

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);


    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }
}

