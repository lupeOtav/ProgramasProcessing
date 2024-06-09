class Pocima {
  PImage imagen;
  int y;
  int x = 0;
  int ancho = 64;
  int alto = 55;
  boolean activa=true;

  Pocima(PImage img, int y, int x) {
    this.imagen = img;
    this.y=y;
    this.x=x;
  }

  void mostrarse() {
    if (activa) {
      image(imagen, x, y, ancho, alto);
    }
  }

  int usarPocima(int vida) {
    if (activa) {
      activa = false;
      return 60 - vida;
    } else {
      return 0;
    }
  }
}
