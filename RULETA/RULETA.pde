PImage sprite;
float i = 1;
float radian = 0;
boolean rotar = false;

String[] opciones = {"azul", "celeste", "ciam", "turquesa", "verde", "lima", "amarillo", "naranja", "rojo", "magenta", "purpura", "violeta"};

void setup() {
  size(400, 400);
  sprite = loadImage("circulox.png");
}

void mostrarAyuda() {
  fill(0);
  textSize(12);
  text("Usar el teclado para arrancar.", 20, 340);
  text("Presionar la flecha derecha para rotar la rueda.", 20, 350);
  text("Presionar la flecha izquierda para frenar la rueda.", 20, 360);
}

void draw() {
  background(220);

  push(); // Iniciar un nuevo estado de dibujo
  translate(200, 200);
  radian = i * PI/180;
  rotate(radian);
  if (rotar) {
    i++;
  }

  if (i > 359) {
    i = 1;
  }
  image(sprite, -50, -50,100,100);
  pop(); // Restaurar estado de dibujo original

  push();
  textSize(12);
  fill(0, 102, 153);
  text("Grado: " + i, 80, 196);
  noFill();
  rect(0, 200, 200, 1);
  rect(163, 0, 1, 208);
  pop();

  push();
  strokeWeight(5);
  point(163, 200);
  pop();

  mostrarAyuda();
}

void keyPressed() {
  if (keyCode == LEFT) {
    rotar = false;
    println(i + ", opcion: " + opciones[(int)(i /30)]);
  } else if (keyCode == RIGHT) {
    rotar = true;
  }
}
