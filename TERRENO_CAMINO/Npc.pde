class Npc {
  PImage personaje;
  int x;
  int y;
  int ancho = 80;
  int alto = 80;
  String[] dialogos = new String[6];
  int dialogoActual = 0;

  Npc(PImage personaje, int ancho, int alto) {
    this.personaje = personaje;
    this.ancho = ancho;
    this.alto = alto;
  }

  void setPosicion(int x, int y) {
    this.x=x;
    this.y=y;
  }
  
  void setDialogos(String[] dialogos) {
    this.dialogos = dialogos;
  }

  String responder() {
    dialogoActual++;
    if(dialogoActual>4){
      return dialogos[5];
    }
    return dialogos[dialogoActual];
  }

  void mostrarse() {
    image(personaje, x, y, ancho, alto);
  }
}
