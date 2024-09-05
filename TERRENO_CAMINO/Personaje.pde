class Personaje {
  PImage personaje;
  PImage personaje2;
  int x;
  int y;
  int ancho = 80;
  int alto = 80;

  Personaje(PImage personaje, PImage personaje2, int x, int y, int ancho, int alto) {
    this.personaje = personaje;
    this.personaje2 = personaje2;
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
  }

  void mostrarse() {
    image(personaje, x, y, ancho, alto);
  }

  void mover(int direccion) {
    switch(direccion) {
    case 1:
      y=y-80;
      break;
    case 2:
      y=y+80;
      break;
    case 3:
      x=x-80;
      break;
    case 4:
      x=x+80;
      break;
    }
  }
}
