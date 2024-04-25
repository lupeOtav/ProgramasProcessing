PImage[] fotogramas;
int i = 0;
int j = 0;
int valor = 255;
int posX = 10;
int posY = 10;

void setup() {
  size(410, 320);
  fotogramas = new PImage[1];
  fotogramas[0] = loadImage("estrella.png");
}

void draw() {
  background(255); // Limpiar el fondo en cada fotograma

  // Iterar sobre las posiciones X
  for (posX = 10; posX < 450; posX += 80) {
    // Iterar sobre las posiciones Y
    for (posY = 0; posY < 340; posY += 120) {
      image(fotogramas[0], posX, posY, 70,70);
    }
  }
}
