class Personaje {
  PImage imagen;
  int x= 300;
  int y=250;
  int ancho= 300;
  int alto=250;
  int direccion;
  boolean detenido=false;
  
  Personaje(PImage imagen, int x, int y, int ancho, int alto) {
    this.imagen = imagen;
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
  }
  void mover(int direccion) {
    if (detenido) {
      return;
    }
   this.direccion = direccion;
    // Establecer la dirección solo en el eje X o en el eje Y
    if (direccion == 1 ) {
      y = y-10;
    } else if (direccion == 2) {
      y = y+10;
    } else if (direccion == 3) {
      x = x-10;
    } else if (direccion == 4) {
      x = x+10;
    }
  }

  void detener() {
    detenido = true;
    switch(direccion) {
    case 1:
      y = y + 10;
      break;
    case 2:
      y = y - 10;
      break;
    case 3:
      x = x + 10;
      break;
    case 4:
      x = x - 10;
      break;
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

  boolean chocaste(Pared unaPared) {
    return x < unaPared.x + unaPared.ancho &&
      x + ancho > unaPared.x &&
      y < unaPared.y + unaPared.alto &&
      y + alto > unaPared.y;
  }
}
