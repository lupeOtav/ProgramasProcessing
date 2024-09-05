class Personaje {
  PImage personaje;
  PImage personajeDer;
  int x;
  int y;
  int ancho = 60;
  int alto = 80;
  boolean avanzando=true;

  Personaje(PImage personaje, PImage personaje2, int x, int y) {
    this.personaje = personaje;
    this.personajeDer = personaje2;
    this.x = x;
    this.y = y;
  }

  void mostrarse() {
    if (avanzando) {
      image(personajeDer, x, y, ancho, alto);
    } else {
      image(personaje, x, y, ancho, alto);
    }
  }

  boolean enCasa(Casa c) {
    return x < c.x + c.ancho && x + ancho > c.x && y < c.y + c.alto && y + alto > c.y;
  }
  void mover(int x, int y, boolean avanzando) {
    this.x = x;
    this.y = y;
    this.avanzando = avanzando;
  }
}
