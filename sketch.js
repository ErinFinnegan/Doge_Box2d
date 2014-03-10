var movers = [];
//var font;
var doge;
//var ArrayOfColors =[ (181, 230, 29), (63, 72, 204), (255, 174, 201), (0, 162, 232), (255, 127, 39), (255, 242, 0), (136, 0, 21), (212, 176, 190), (207, 209, 100), (200, 120, 87)];
var words =["wow", "much processing", "very Java", "much codee", "very scare", "PVectro", "much force", "frictoin", 
  "wow", "very Newton", "much law",];
var index = Math.floor(random(words.length)); 
var rgb;
var bounce;



function setup() {
  createGraphics(1000, 750);
  millis();
  doge = loadImage("dogenowords2.jpg");
  //font = loadFont("ComicSansMS-Bold-40.vlw");
  //randomSeed(1);
  for (var i = 0; i < 10; i++) {
    movers[i] = new Mover(random(0.5, 8), random(width), 0);
  }
  bounce = 0;
  //fill(ArrayOfColors[(var) random(ArrayOfColors.length)]);
  //rgb = (ArrayOfColors[random(ArrayOfColors.length)]);
  //fill(rgb);
  //Pick one word and one color per word at random from my arrays and then use those words in the draw loop as movers
};

function draw() {
  background(255);
  image(doge, 0, 0);
  for (var i = 0; i < movers.length; i++) {
    var wind = new PVector(1, 0);
    var gravity = new PVector(0, (1.0*movers[i].mass + (bounce/5)));
    var c = 0.1;
    var friction = new PVector(movers[i].velocity.x,movers[i].velocity.y);
    friction.mult(-1.5); 
    friction.normalize();
    friction.mult(c);

    movers[i].applyForce(friction);
    if (bounce > 50) {
      movers[i].applyForce(wind);
    };
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  };
};



