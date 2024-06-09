PImage[] objetos = new PImage[9];
String[] textos = {"Paja", "Barril", "Ladrillo", "Tronco", "Piedra", "Valla", "Carro", "Cajas", "Diana"};
boolean[] estados = {false, false, false, false, false, false, false, false, false};
int i = 0;
PImage fondo;
int elemento1 = 0;
int elemento2 = 0;
int elemento3 = 0;
boolean ganaste = false;

void setup() {
  size(840, 600);
  fondo = loadImage("FONDO3.jpg");

  objetos[0] = loadImage("B1.png");
  objetos[1] = loadImage("B2.png");
  objetos[2] = loadImage("B3.png");
  objetos[3] = loadImage("B4.png");
  objetos[4] = loadImage("B5.png");
  objetos[5] = loadImage("B6.png");
  objetos[6] = loadImage("B7.png");
  objetos[7] = loadImage("B8.png");
  objetos[8] = loadImage("B9.png");

  elementosReceta();
}

void elementosReceta() {
  elemento1 = int(random(0, 9)) ;
  do {
    elemento2 = int(random(0, 9));
  } while (elemento2 == elemento1);

  do {
    elemento3 = int(random(0, 9));
  } while (elemento3 == elemento1 || elemento3 == elemento2);
  println("elemento1 " + textos[elemento1]);
  println("elemento2 " + textos[elemento2]);
  println("elemento3 " + textos[elemento3]);
}

void draw() {
  i=0;
  fill(0);
  textSize(14);
  image(fondo, 0, 0, 840, 600);
  textSize(32);
  for (int x = 50; x < 300; x = x + 120) {
    for (int y = 50; y < 300; y = y + 120) {
      image(objetos[i], x, y, 100, 100);
      if (estados[i]) {
        text(textos[i], x, y + 120);
      }
      i++;
    }
  }
  textSize(18);
  text("Seleccioná los tres elementos que se ven en el recuadro de la derecha haciendo clic en las imagenes de la izquierda y presioná el boton ganar", 400, 130, 200, 200);
  fill(255, 180, 180);
  rect(400, 300, 200, 80);
  textSize(24);
  fill(0);
  text("Ganar", 450, 340);
  fill(255);
  rect(690, 130, 80, 250);
  image(objetos[elemento1], 700, 140, 60, 60);
  image(objetos[elemento2], 700, 220, 60, 60);
  image(objetos[elemento3], 700, 310, 60, 60);
  if (ganaste) {
    fill(255);
    rect(80, 480, 700, 100);
    fill(0);
    textSize(36);
    text("Seleccionaste todos los objetos necesarios, ¡Felicitaciones!", 120, 500, 680, 80);
  }
}

void mousePressed() {
  //chequear si presioné el boton ganar
  if (mouseX>400 && mouseX<600 && mouseY>200 && mouseY<380) {
    if (estados[elemento1] && estados[elemento2] && estados[elemento3]) {
      ganaste = true;
    }
  } else { //si no presione el boton chequear si presioné alguna de las imagenes
    i = 0;

    for (int x = 50; x < 300; x = x + 120) {
      for (int y = 50; y < 300; y = y + 120) {
        if (mouseX > x && mouseX < x + 100 && mouseY > y && mouseY < y + 100) {
          estados[i] = true; //si presione una imagen ponerla en true para despues saber que si elegi ese objeto
        }
        i++;
      }
    }
  }
}
