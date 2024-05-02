
class Carta {
  int x, y; // Posición de la carta
  int ancho, alto; // Ancho y alto de la carta
  PImage frente, dorso; // Imágenes para el frente y el dorso de la carta
  boolean estaDeFrente = false;
  boolean encontroPar= false;
  // Constructor
  Carta(int posX, int posY, int w, int h, PImage imgFrente, PImage imgDorso) {
    x = posX;
    y = posY;
    ancho = w;
    alto = h;
    frente = imgFrente;
    dorso = imgDorso;
  }

  boolean mouseEncima() {
    return mouseX >= x && mouseX <= x + ancho && mouseY >= y && mouseY <= y + alto;
  }
  void setEncontroPar(boolean estado) {
    encontroPar=estado;
  }
  boolean clickeada() {
    return mouseEncima() && mousePressed;
  }

  void darVuelta() {
    if (!encontroPar) {
      estaDeFrente=!estaDeFrente;
    }
  }

  void mostrarDorso() {
    estaDeFrente = false;
  }
  void mostrar() {
    if (estaDeFrente) {
      image(frente, x, y, ancho, alto);
    } else {
      image(dorso, x, y, ancho, alto);
    }
  }
}
