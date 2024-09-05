class Tramo {
  int x, y;
  int ancho, alto;
  boolean hayCasa = false;
  Casa casa;

  Tramo(int posX, int posY, int w, int h) {
    x = posX;
    y = posY;
    ancho = w;
    alto = h;
  }

  void mostrar() {
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x, y, ancho, alto);
  }
  void mostrarCasa() {
    casa.mostrarInterior();
  }
  void ocultarInteriorCasa() {
    casa.ocultarInterior();
  }

  void ponerCasa(Casa unaCasa) {
    casa = unaCasa;
    hayCasa = true;
  }
}
