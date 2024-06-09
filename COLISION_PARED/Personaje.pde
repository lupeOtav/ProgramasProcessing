class Personaje {
  float x, y; // Posición del personaje
  float velocidad = 2; // Velocidad de movimiento
  PImage imagen; // Imagen del personaje
  float ancho, alto; // Dimensiones del personaje
  float direccionX = 0;
  float direccionY = 0;

  Personaje(float posX, float posY, PImage img) {
    x = posX;
    y = posY;
    imagen = img;
    ancho = img.width/10;
    alto = img.height/10;
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
    if (x<0) {
      x =400;
    } else if (x>400) {
      x=0;
    }
    if (y<0) {
      y =400;
    } else if (y>400) {
      y=0;
    }
  }

  void mostrar() {
    image(imagen, x, y, ancho, alto);
  }

  void cambiarAColisionado(int opcion) {//aca podria colisionar con muchas mas cosas
    switch(opcion) {
    case 0://si choque contra una pared
      detener();
      break;
    case 1://si choque contra un enemigo
      //aca haria algo, podria perder una vida o ps
      break;
    }
  }

  // Método para verificar colisiones con un enemigo
  boolean colision(Enemigo otro) {
    return x < otro.x + otro.ancho &&
      x + ancho > otro.x &&
      y < otro.y + otro.alto &&
      y + alto > otro.y;
  }

  // Método para verificar colisiones con una pared
  boolean colisionPared(Pared unaPared) {
    return x < unaPared.x + unaPared.ancho &&
      x + ancho > unaPared.x &&
      y < unaPared.y + unaPared.alto &&
      y + alto > unaPared.y;
  }
}
