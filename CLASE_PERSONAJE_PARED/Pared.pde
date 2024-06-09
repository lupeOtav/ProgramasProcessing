class Pared{
  int x;
  int y;
  int ancho;
  int alto;

  Pared( int x, int y, int ancho, int alto) {
    this.x=x;
    this.y=y;
    this.ancho=ancho;
    this.alto=alto;
  }
  
  void mostrarse(){
   fill(175,0,0);
   rect(x,y,ancho,alto);
  }
}
