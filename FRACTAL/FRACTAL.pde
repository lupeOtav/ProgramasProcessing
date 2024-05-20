float tamaño = 60;
float angulo = -PI/2;
int extra = 30;

void setup() {
  size(900, 700);
  background(255);
}

void draw() {
  angulo+=0.01;
  tamaño = 50 + extra*cos(millis() *0.01);
}

void mouseDragged() {
  drawFractal(mouseX, mouseY, tamaño, angulo, tamaño / 12.5);
}

void keyPressed() {
  switch(key)
  {
  case 'k':
    stroke(0);
    break;
  case 'w':
    stroke(255);
    break;
  case 'a':
    angulo+=10;
    break;
  case 'd':
    angulo-=10;
    break;
  case '+':
    extra+=10;
    break;
  case '-':
    extra-=10;
    break;
  }
}

void drawFractal(float x, float y, float len, float angle, float level) {
  if (level > 0) {
    // Dibuja la rama actual
    float x2 = x + cos(angle) * len;
    float y2 = y + sin(angle) * len;
    line(x, y, x2, y2);

    // Calcula las ramas izquierda y derecha con variación aleatoria en el ángulo y la longitud
    float newLen = len * random(0.5, 0.8); // Longitud aleatoria
    float newLevel = level - 1;
    float leftAngle = angle - random(PI/10, PI/5); // Ángulo aleatorio para la rama izquierda
    float rightAngle = angle + random(PI/10, PI/5); // Ángulo aleatorio para la rama derecha

    // Dibuja las ramas izquierda y derecha recursivamente
    drawFractal(x2, y2, newLen, leftAngle, newLevel);
    drawFractal(x2, y2, newLen, rightAngle, newLevel);
  }
}
