
String[] superlatives = {"such", "very", "wow", "lol", "much"};
String[] subjects = {"box2d", "shiffman", "boids", "physics"};

for (int i = 0 ; i<10; i++){
  int superlativeIndex = int(random(superlatives.length));
  int subjectIndex = int(random(subjects.length));
 
 println(superlatives[superlativeIndex] + " " + subjects[subjectIndex]); 
}
