class Enemigo {
  float x, y; // Posición del personaje
  float velocidad = 10; // Velocidad de movimiento
  float diametro = 20; // Tamaño del personaje
  color colorActual;
  boolean yendo = true;

  Enemigo(float posX, float posY) {
    x = posX;
    y = posY;
    colorActual = color(0, 255, 0);
  }

  void mostrar() {
    // Dibujar el personaje
    fill(colorActual);
    ellipse(x, y, diametro, diametro);
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
