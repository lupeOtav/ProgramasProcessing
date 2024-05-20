PImage[] fotogramas = new PImage[8];
PImage fondo;
float i = 0;
float velocidad = 0.2;
float posx = -100;
PImage personajeActual;
boolean dadaVuelta = false;

void setup() {
  size(1000, 400);
  fotogramas[0] = loadImage("f1.png");
  fotogramas[1] = loadImage("f2.png");
  fotogramas[2] = loadImage("f3.png");
  fotogramas[3] = loadImage("f4.png");
  fotogramas[4] = loadImage("f5.png");
  fotogramas[5] = loadImage("f6.png");
  fotogramas[6] = loadImage("f7.png");
  fotogramas[7] = loadImage("f8.png");
  fondo = loadImage("sky.jpg");
  personajeActual = fotogramas[0]; // La primera imagen del personaje
}

void draw() {
  image(fondo, 0, 0, 1000, 400);
  caminar();
}

void caminar() {
  if (dadaVuelta) {
    pushMatrix();
    scale(-2, 2); // espejar horizontalmente y agrandar cuando vuelve
    image(personajeActual, -posx, 50); // Dibujar la imagen espejada
    popMatrix();
    posx -= 8;
    if (posx<0) {
      dadaVuelta = false;
    }
  } else {//caminando hacia la derecha
    image(personajeActual, posx, 100);
    posx += 5;
    if (posx >1000) {
      dadaVuelta = true;
    }
  }

  i = (i + velocidad) % 8;
  personajeActual = fotogramas[floor(i)];
}
