function Mover(m, x, y) {

  this.location = new PVector(x,y);
  this.velocity = new PVector(0,0);
  this.acceleration = new PVector(0,0);
  this.mass = m;
}

  Mover.prototype.applyForce = function (force) {
    var f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  // Mover(float m, float x, float y) {
  //   mass = m;
  //   location = new PVector(x, y);
  //   velocity = new PVector(0, 0);
  //   acceleration = new PVector(0, 0);
  // }

  Mover.prototype.applyForce = function (force) {
    var f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

Mover.prototype.update = function () {
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration.mult(0);
  }

Mover.prototype.display = function () {
    //textFont(font, (mass*16));
    textSize(this.mass*16);
    text((words[index]), this.location.x, this.location.y);
    //ellipse(location.x, location.y, mass*16, mass*16);
  };

Mover.prototype.checkEdges = function() {

    if (this.location.x < 0) {
      this.location.x = 0;
      this.velocity.x *= -1;
    }

    //    if (location.x > width) {
    //      location.x = width;
    //      velocity.x *= -1;
    //    } 
    if (this.location.x < 0) {
      this.location.x = 0;
      this.velocity.x *= -1;
    }

    if (this.location.y > height) {
      this.velocity.y *= -1;
      this.location.y = height;
    }
    if (this.location.y == height) {
      ++bounce;
    }
};
