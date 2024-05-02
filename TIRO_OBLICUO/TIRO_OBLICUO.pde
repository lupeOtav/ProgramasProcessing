float angulo = 0;
float x1 = 50;
float y1 = 200;
float alfa = 0;
float t = 0;
float v0 = 30;
color color1;
float radian = 0;

void setup() {
  size(400, 400);
  color1 = color(255, 255, 255);
}

void draw() {
  background(220, 220, 220, 30);
  fill(color1);
  disparar();
  fill(0);
  text("Presionar a o b para cambiar el ángulo de disparo", 20, 340);
  text("Presionar c o d para cambiar la velocidad inicial del disparo", 20, 360);
  pushMatrix();
  translate(10, 150);
  radian = alfa * PI/180;
  rotate(-radian);
  fill(255);
  // Dibuja la flecha blanca
  beginShape();
  vertex(25, 60);
  vertex(0, 60);
  vertex(0, 40);
  vertex(20, 40);
  vertex(25, 40);
  vertex(25, 30);
  vertex(45, 50);
  vertex(25, 70);
  vertex(25, 60);
  endShape();
  popMatrix();
  fill(255, 255, 0);
  ellipse(200, 200, 40, 40);
  fill(0, 255, 255);
  ellipse(350, 200, 40, 40);
}

void disparar() {
  float r = t * 2;
  ellipse(x1, y1, r, r);
  float d = dist(200, 200, x1, y1);
  if (d < r + 20) {
    color1 = color(255, 255, 0);
  }
  d = dist(350, 200, x1, y1);
  if (d < r + 20) {
    color1 = color(0, 255, 255);
  }
  radian = alfa * PI/180;
  x1 = 50 + v0 * cos(radian) * t;
  y1 = 200 - v0 * sin(radian) * t + 4.9 * t * t;
  t = t + 0.1;
  if (t > 20) {
    t = 0;
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    alfa = alfa + 10;
  }
  if (key == 'b' || key == 'B') {
    alfa = alfa - 10;
  }
  if (key == 'c' || key == 'C') {
    strokeWeight(v0 / 40);
    v0 = v0 + 5;
  }
  if (key == 'd' || key == 'D') {
    v0 = v0 - 5;
  }
}
