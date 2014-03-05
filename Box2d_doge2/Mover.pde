class Mover {

  Body body;
  float w =  random(4, 16);
  float h = random(4, 16);

  String[] words = { 
    "wow", "much processing", "very Java", "much codee", "very scare", 
    "wow", "box2d", "toxilibs", "very fixture", "much bounce",
  };

  int index = int(random(words.length)); 

  color[] ArrayOfColors = { 
    color(181, 230, 29), color(63, 72, 204), color(255, 174, 201), color(0, 162, 232), color(255, 127, 39), color(255, 242, 0), color(136, 0, 21), color(212, 176, 190), color(207, 209, 100), color(200, 120, 87)
  };
  color rgb = (ArrayOfColors[(int) random(ArrayOfColors.length)]);  //add psychedelic color spray
  int fontSize = int(random(12, 40));

  Mover(float x, float y) {
    //mass = m;
    //    location = new PVector(x, y);
    //    velocity = new PVector(0, 0);
    //    acceleration = new PVector(0, 0);
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w+25);
    float box2dH = box2d.scalarPixelsToWorld(h+20);  // Box2D considers the width and height of a
    ps.setAsBox(box2dW, box2dH);            // rectangle to be the distance from the
    // center to the edge (so half of what we
    // normally think of as width or height.) 
    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Attach Fixture to Body               
    body.createFixture(fd);
  }

  //  void applyForce(PVector force) {
  //    PVector f = PVector.div(force, mass);
  //    acceleration.add(f);
  //  }

  //  void update() {
  //    velocity.add(acceleration);
  //    location.add(velocity);
  //    acceleration.mult(0);
  //  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    fill(rgb);
    textFont(font, fontSize);
    //    textFont(font, (mass*16));
    text((words[index]), w, h);
    //ellipse(location.x, location.y, mass*16, mass*16);
    popMatrix();
  }

  //  void checkEdges() {
  //
  //    if (location.x < 0) {
  //      location.x = 0;
  //      velocity.x *= -1;
  //    }
  //
  //    //    if (location.x > width) {
  //    //      location.x = width;
  //    //      velocity.x *= -1;
  //    //    } 
  //    if (location.x < 0) {
  //      location.x = 0;
  //      velocity.x *= -1;
  //    }
  //
  //    if (location.y > height) {
  //      velocity.y *= -1;
  //      location.y = height;
  //    }
  //    if (location.y == height) {
  //      ++bounce;
  //    }
  //  }
}

