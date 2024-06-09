class Personaje {
  PImage personaje;
  PImage personajeColisionado;
  int x;
  int y;
  int ancho = 80;
  int alto = 80;
  int vida = 60;
  boolean muerto = false;
  boolean envenenado = false;

  Personaje(PImage personaje, PImage personaje2, int x, int y) {
    this.personaje = personaje;
    this.personajeColisionado = personaje2;
    this.x = x;
    this.y = y;
  }

  void mostrarse() {
    if (muerto) {
      textSize(32);
      fill(100);
      text("Game over", 225, 300);
      return;
    }
    if (envenenado) {
      image(personajeColisionado, x, y, ancho, alto);
    } else {
      image(personaje, x, y, ancho, alto);
    }
    fill(255, 100, 0);
    rect(x+35, y-70, 10, 60);
    fill(0, 255, 0);
    rect(x+35, y-70, 10, vida);
  }

  void envenenado() {
    envenenado = true;
    if (vida>0) {
      vida--;
    } else if (vida == 0) {
      morirse();
    }
  }

  void morirse() {
    muerto = true;
  }

  void curado() {
    envenenado = false;
  }

  void tomarPocima(Pocima unaPocima) {
    vida = vida + unaPocima.usarPocima(this.vida);
  }
  boolean encontrastePocima(Pocima p) {
    return x < p.x + p.ancho && x+ancho > p.x && y < p.y + p.alto && y+alto > p.y;
  }
  boolean chocaste(Enemigo e) {
    return x < e.x + e.ancho && x+ancho > e.x && y < e.y + e.alto && y+alto > e.y;
  }

  void mover(int direccion) {
    if (muerto) {
      return;
    }
    switch(direccion) {
    case 1:
      y=y-10;
      break;
    case 2:
      y=y+10;
      break;
    case 3:
      x=x-10;
      break;
    case 4:
      x=x+10;
      break;
    }
  }
}
