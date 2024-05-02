ArrayList<Pieza> piezas = new ArrayList<Pieza>();
PImage fondo;
int contador = 0;

void setup() {
  size(480, 624);
  noFill();
  noStroke();

  fondo = loadImage("grilla.png");

  // Crea 12 piezas con imágenes y posiciones iniciales y finales
  crearPieza(310 *0.8, 295*0.8, "p1.png");
  crearPieza(306*0.8, 225*0.8, "p2.png");
  crearPieza(304*0.8, 312*0.8, "p3.png");
  crearPieza(242*0.8, 261*0.8, "p4.png");

  crearPieza(218*0.8, 281*0.8, "p5.png");
  crearPieza(197*0.8, 194*0.8, "p6.png");
  crearPieza(295*0.8, 113*0.8, "p7.png");
  crearPieza(134*0.8, 212*0.8, "p8.png");

  crearPieza(143*0.8, 159*0.8, "p9.png");
  crearPieza(123*0.8, 370*0.8, "p10.png");
  crearPieza(204*0.8, 163*0.8, "p11.png");
  crearPieza(66*0.8, 255*0.8, "p12.png");
}

void draw() {
  background(220);

  for (Pieza pieza : piezas) {
    pieza.mostrar();
  }
  float nuevoAncho = fondo.width * 0.8;
  float nuevoAlto = fondo.height * 0.8;

  image(fondo, 0, 0, nuevoAncho, nuevoAlto);
}

void mousePressed() {
  for (Pieza pieza : piezas) {
    if (pieza.contiene(mouseX, mouseY)) {
      pieza.arrastrando = true;
      pieza.offsetX = mouseX - pieza.x;
      pieza.offsetY = mouseY - pieza.y;
      return;
    }
  }
}

void mouseReleased() {
  for (Pieza pieza : piezas) {
    pieza.arrastrando = false;
  }
}

void crearPieza(float ancho, float alto, String nombre) {
  float x = random(width - 100);
  float y = random(height - 100);
  PImage imagen = loadImage(nombre);
  piezas.add(new Pieza(x, y, ancho, alto, imagen));
}

class Pieza {
  float x, y, ancho, alto, finalX, finalY;
  PImage imagen;
  boolean arrastrando = false;
  float offsetX, offsetY;

  Pieza(float x, float y, float ancho, float alto, PImage imagen) {
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
    this.imagen = imagen;
  }

  void mostrar() {
    if (arrastrando) {
      x = mouseX - offsetX;
      y = mouseY - offsetY;
    }
    float nuevoAncho = imagen.width * 0.8;
    float nuevoAlto = imagen.height * 0.8;

    image(imagen, x, y, nuevoAncho, nuevoAlto);
  }

  boolean contiene(float px, float py) {
    return (px > x && px < x + ancho && py > y && py < y + alto);
  }
}
