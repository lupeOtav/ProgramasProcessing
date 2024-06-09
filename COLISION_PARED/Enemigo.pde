class Enemigo {
  float x, y; // Posición del personaje
  float velocidad = 10; // Velocidad de movimiento
  boolean yendo = true;
  PImage imagen;
  int ancho, alto;
  
  Enemigo(float posX, float posY, int ancho, int alto, PImage imag) {
    imagen = imag;
    x = posX;
    y = posY;
    this.ancho=ancho;
    this.alto=alto;
  }

  void mostrar() {
    // Dibujar el personaje
    image(imagen, x, y, ancho, alto);
    if (yendo) {
      x++;
    } else {
      x--;
    }
    if (x<0  || x>400)
    {
      yendo=!yendo;
    }
  }
}
