class Baldosa {
  int x, y;
  int ancho, alto;
  PImage textura;
  boolean hayNpc = false;
  
  Baldosa(int posX, int posY, int w, int h, PImage tex, int opcion) {
    x = posX;
    y = posY;
    ancho = w;
    alto = h;
    textura = tex;
    if(opcion == 3){
      hayNpc = true;
    }
  }
  
  boolean sePuedeOcupar(){
   return !hayNpc;
  }
  
  void mostrar(){
    image(textura, x, y, ancho, alto);
  }
}
