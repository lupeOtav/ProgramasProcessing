class Personaje {
  float x, y; // Posición del personaje
  float velocidad = 2; // Velocidad de movimiento
  float diametro = 20; // Tamaño del personaje
  color colorActual, colorMuerto, colorChoque, colorNormal;
  float direccionX = 0;
  float direccionY = 0;
  boolean titilar = false;

  Personaje(float posX, float posY) {
    x = posX;
    y = posY;

    colorNormal = color(255, 255, 0);
    colorMuerto = color(0);
    colorChoque = color(255, 0, 0);
    colorActual = colorNormal;
  }

  void mover(char direccion) {
    // Establecer la dirección solo en el eje X o en el eje Y
    if (direccion == 'W' || direccion == 'w' || keyCode == UP) {
      direccionX = 0;
      direccionY = -velocidad; // Mover hacia arriba
    } else if (direccion == 'S' || direccion == 's' || keyCode == DOWN) {
      direccionX = 0;
      direccionY = velocidad; // Mover hacia abajo
    } else if (direccion == 'A' || direccion == 'a' || keyCode == LEFT) {
      direccionX = -velocidad; // Mover hacia la izquierda
      direccionY = 0;
    } else if (direccion == 'D' || direccion == 'd' || keyCode == RIGHT) {
      direccionX = velocidad; // Mover hacia la derecha
      direccionY = 0;
    }
  }

  void detener() {
    x -= direccionX;
    y -= direccionY;
    direccionX = 0;
    direccionY = 0;
  }

  void actualizarPosicion() {
    x += direccionX;
    y += direccionY;
  }

  void mostrar() {
    if (titilar) {
      fill(255 * floor(cos(millis() * 0.005)));
    } else {
      fill(colorActual);
    }

    ellipse(x, y, diametro, diametro);
  }

  void cambiarColorColisionado(int opcion) {
    switch(opcion) {
    case 0://si choque contra una pared
      colorActual = colorChoque;
      detener();
      titilar = false;
      break;
    case 1://si choque contra un enemigo
      titilar = true;
      break;
    }
  }

  // Método para verificar colisiones con un enemigo
  boolean colision(Enemigo otro) {
    float distancia = dist(x, y, otro.x, otro.y);
    return distancia < (diametro + otro.diametro) / 2;
  }

  // Método para verificar colisiones con una pared
  boolean colisionPared(Pared unaPared) {
    float radio = diametro/2;
    return x - radio < unaPared.x + unaPared.ancho &&
      x + radio > unaPared.x &&
      y - radio < unaPared.y + unaPared.alto &&
      y + radio > unaPared.y;
  }
}
