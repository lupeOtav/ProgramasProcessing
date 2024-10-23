void dibujarFondo() {
  image(fondo, marx1, 0, fondoAncho, 400);
  image(fondo, marx2, 0, fondoAncho, 400);
  image(roca, posxr, 200, roca.width * rocaSize, roca.height * rocaSize);
 actualizarPosicionMar();
}
void  actualizarPosicionMar(){
  if (yendo) {
    marx1 = marx1 - marVelocidad;
    marx2 = marx2 - marVelocidad;
    if (marx1 <= -fondoAncho) {
      marx1 = marx2 + fondoAncho;
    }
    if (marx2 <= -fondoAncho) {
      marx2 = marx1 + fondoAncho;
    }
  } else {
    marx1 = marx1 + marVelocidad;
    marx2 = marx2 + marVelocidad;
    if (marx1 >= fondoAncho) {
      marx1 = marx2 - fondoAncho;
    }
    if (marx2 >= fondoAncho) {
      marx2 = marx1 - fondoAncho;
    }
  }
}
