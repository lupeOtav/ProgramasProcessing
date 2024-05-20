int brushColor = 0; // Inicialmente el color del pincel es negro
int brushSize = 10; // Inicialmente el tamaño del pincel es 10

void setup() {

  size(400, 400);
  background(255);
}

void draw() {
  noStroke();
  textSize(18);
  fill(255);
  rect(0, 380, 400, 20);
  fill(0);
  text("Teclas disponibles: r,g,b, ,y,m,c, k,w, o,l,t,f,x,  +, -", 20, 390);
}

void mouseDragged() {
  // Cuando se arrastra el mouse, dibujamos una línea desde la posición anterior del mouse hasta la posición actual
  fill(brushColor);
  stroke(brushColor);
  strokeWeight(brushSize);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  // Cambiar el color del pincel usando las teclas 'r' (rojo), 'g' (verde), 'b' (azul), 'k' (negro) y 'w' (blanco)
  switch (key) {
  case 'r':
    brushColor = color(255, 0, 0);
    break;
  case 'g':
    brushColor = color(0, 255, 0);
    break;
  case 'b':
    brushColor = color(0, 0, 255);
    break;
  case 'x':
    brushColor = color(0, 128, 255);
    break;
  case 't':
    brushColor = color(0, 255, 128);
    break;
  case 'c':
    brushColor = color(0, 255, 255);
    break;
  case 'm':
    brushColor = color(255, 0, 255);
    break;
  case 'l':
    brushColor = color(128, 255, 0);
    break;
  case 'o':
    brushColor = color(255, 128, 0);
    break;
  case 'y':
    brushColor = color(255, 255, 0);
    break;
  case 'v':
    brushColor = color(128, 0, 255);
    break;
  case 'f':
    brushColor = color(255, 0, 128);
    break;
  case 'k':
    brushColor = color(0);
    break;
  case 'w':
    brushColor = color(255);
    break;
  case '+':
    brushSize += 5;
    break;
  case '-':
    brushSize = max(5, brushSize - 5);
    break;
  }
}
