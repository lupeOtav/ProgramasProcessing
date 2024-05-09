class TextBox {
  float x, y, ancho, alto;
  String texto = "";
  boolean enfocado = false;
boolean textoPorDefecto = true;

  TextBox(float x, float y, float ancho, float alto) {
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
  }
 
 String getTexto(){
  return texto; 
 }
 
  void mostrar() {
    if(enfocado){
     fill(255); 
    }else{
      noFill();
    }
    stroke(0);
    rect(x, y, ancho, alto);
    textAlign(LEFT);
    fill(0);
    text(texto, x + 5, y + alto - 5);
  }

  boolean estaEnfocado() {
    return mouseX > x && mouseX < x + ancho && mouseY > y && mouseY < y + alto;
  }

  void enfocar(boolean enf) {
    enfocado = enf;
  }

  void manejarEntradaTeclado() {
    if (enfocado) {
      if (key == BACKSPACE && texto.length() > 0) {
        texto = texto.substring(0, texto.length() - 1);
      } else if (key != ENTER && key != CODED) {
        if(textoPorDefecto){
          texto = "" + key;
          textoPorDefecto = false;
        }else{
          texto += key;
        } 
      }
    }
  }
}
