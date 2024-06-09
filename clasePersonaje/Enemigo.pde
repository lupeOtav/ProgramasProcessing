class Enemigo {
  PImage enemigo;
  int velocidad;
  int y;
  int x = 0;
  int ancho = 80;
  int alto = 80;
  boolean avanzandoDerecha = true;
  
  Enemigo(PImage enemigo, int y, int x) {
    this.enemigo = enemigo;
    this.y=y;
    this.velocidad=int(random(1,10));
    this.x=x;
  }

  void mostrarse() {
    x=avanzar(x);
    image(enemigo, x, y, ancho, alto);
  }

  int avanzar(int posx) {
    if (avanzandoDerecha) {
      posx = posx + velocidad;
    } else {
      posx = posx - velocidad;
    }
    if (posx>520) {
      avanzandoDerecha = false;
    } else if (posx<0) {
      avanzandoDerecha = true;
    }
    return posx;
  }
}
