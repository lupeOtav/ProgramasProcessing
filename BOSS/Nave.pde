class Nave {
  float x, y;
  float velocidad = 5;
  color colorNave;
  int vida = 200;
  PImage sprite;
  
  Nave(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.colorNave = c;
    this.sprite = loadImage("nave1.png");
  }
  
  void mover() {
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        x -= velocidad;
      } else if (key == 'd' || key == 'D') {
        x += velocidad;
      }
    }
    x = constrain(x, 0, width);
  }
  
  void mostrar() {
    fill(colorNave);
    rectMode(CENTER);
    rect(x, y, 40, 20);
    image(sprite, x -40, y - 50, 80,60);
  }
  
  boolean colision(Bomba d) {
    float distancia = dist(x, y, d.x, d.y);
    return distancia < 20; // Radio de la nave
  }
  
  boolean perderVida() {
    vida -= 50;
    if (vida <= 0) {
      // La nave ha sido destruida
      // Puedes agregar aquí cualquier acción adicional que desees
      vida = 0;
      return true;
    }
    return false;
  }
}

class Disparo {
  float x, y;
  float velocidad = 10;
  color colorDisparo;
  
  Disparo(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.colorDisparo = c;
  }
  
  void mover() {
    y -= velocidad;
    if (y < 0) {
      // Eliminar el disparo si sale de la pantalla
      disparosJugador.remove(this);
    }
  }
  
  void mostrar() {
    fill(colorDisparo);
    ellipse(x, y, 5, 10);
  }
}

  
