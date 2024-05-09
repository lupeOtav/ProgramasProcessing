class Edificio {
  PImage imagen;
  int ancho, alto;
  int x, y;
  String nombre;
  String descripcion;
  int pesosProducidos;
  int pesosCosto;
  String recursosNecesarios;//de momento no los voy a usar
  boolean isDragging = false;
  int tamaño;
  boolean emplazado = false;

  Edificio(PImage img, int ancho, int alto, int x, int y, String nombre, String desc, int producidos, int costo, String recursos) {
    imagen = img;
    this.ancho = ancho;
    this.alto = alto;
    this.x = x;
    this.y = y;
    this.nombre = nombre;
    descripcion = desc;
    pesosProducidos = producidos;
    pesosCosto = costo;
    recursosNecesarios = recursos;
    tamaño = 70; // Tamaño inicial
  }

  int getCosto() {
    return pesosCosto;
  }
  void emplazar() { 
    emplazado = true;
  }
  boolean getEmplazado() {
    return emplazado;
  }

  String getNombre() {
    return nombre;
  }

  String getDescripcion() {
    return descripcion;
  }
int producir(){
 return pesosProducidos;
}
  void display() {
    image(imagen, x, y, tamaño, tamaño); //ancho, alto);//tamaño, tamaño);
  }

  boolean clickeado(int mousex, int mousey) {
    return (mousex > x && mousex < x + tamaño && mousey > y && mousey < y + tamaño);
  }
}
