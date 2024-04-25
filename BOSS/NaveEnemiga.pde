class NaveEnemiga {
  float x, y;
  float velocidad = 2;
  color colorNave;
  int vida = 200;
  boolean yendo = false;
  PImage sprite;

  NaveEnemiga(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.colorNave = c;
    this.sprite = loadImage("nave2.png");
  }

  void mover() {
    if (yendo) {
      x += velocidad;
    } else {
      x-= velocidad;
    }

    if (x<10 || x>790) {
      yendo =!yendo;
    }
  }

  void mostrar() {
    fill(colorNave);
    rectMode(CENTER);
    // rect(x, y, 40, 20);
    image(sprite, x -30, y - 10, 120, 120);
  }

  boolean colision(Disparo d) {
    float distancia = dist(x, y, d.x, d.y);
    return distancia < 20; // Radio de la nave
  }

  boolean perderVida() {
    vida -= 10;
    if (vida <= 0) {
      // La nave enemiga ha sido destruida
      
      // Puedes agregar aquí cualquier acción adicional que desees
      vida = 0;
      return true;
    }
    return false;
  }
}

class Bomba {
  float x, y;
  float velocidad = 10;
  color colorDisparo;

  Bomba(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.colorDisparo = c;
  }

  void mover() {
    y += velocidad;
    if (y < 0) {
      // Eliminar el disparo si sale de la pantalla
      disparosEnemigos.remove(this);
    }
  }
  /* void mover() {
   y += velocidad;
   if (y > height || y < 0) {
   // Eliminar el disparo si sale de la pantalla
   disparosJugador.remove(this);
   disparosEnemigos.remove(this);
   }
   }*/
  void mostrar() {
    fill(colorDisparo);
    ellipse(x, y, 15, 15);
  }
}
