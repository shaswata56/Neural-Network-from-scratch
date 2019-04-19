Perceptron ptron;

Trainer[] training = new Trainer[200000];
int count = 0;

float f(float x) {
  return 2*x+1;
}

void settings() {
  size(640, 360);
}
 
void setup() {
  ptron = new Perceptron(3);
 
  for (int i = 0; i < training.length; i++) {
    float x = random(-width/2,width/2);
    float y = random(-height/2,height/2);
    int answer = 1;
    if (y < f(x)) answer = -1;
    training[i] = new Trainer(x, y, answer);
  }
}
 
 
void draw() {
  background(255);
  translate(width/2,height/2);
 
  count = (count + 1) % training.length;
 
  for (int i = 0; i < count; i++) {
    stroke(0);
    int guess = ptron.feedforward(training[i].inputs);
    if (guess > 0) noFill();
    else fill(0);
    ellipse(training[i].inputs[0], training[i].inputs[1], 8, 8);
  }
}
