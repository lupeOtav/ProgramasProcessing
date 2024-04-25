class Boton {
  int x, y; // Posición del botón
  int ancho, alto; // Ancho y alto del botón
  color colorNormal, colorHover; // Colores para diferentes estados
  color bordeNormal, bordeHover; // Colores para diferentes estados

  String etiqueta; // Texto del botón
  PFont fuente; // Fuente para el texto

  // Constructor
  Boton(int posX, int posY, int w, int h, String texto) {
    x = posX;
    y = posY;
    ancho = w;
    alto = h;
    etiqueta = texto;

    // Colores predeterminados
    colorNormal = color(255);
    colorHover = color(200);

    // Colores predeterminados
    bordeNormal = color(50);
    bordeHover = color(0, 125, 240);

    // Fuente predeterminada
    fuente = createFont("Arial", 16);
  }

  // Método para verificar si el mouse está sobre el botón
  boolean mouseEncima() {
    return mouseX >= x && mouseX <= x + ancho && mouseY >= y && mouseY <= y + alto;
  }

  // Método para verificar si se ha hecho clic en el botón
  boolean clickeado() {
    return mouseEncima() && mousePressed;
  }

  // Método para mostrar el botón
  boolean mostrar() {
    textAlign(CENTER, CENTER);
    textFont(fuente);

    if (mouseEncima()) {
      fill(colorHover); // Cambia el color si el mouse está sobre el botón
      stroke(bordeHover);
      textSize(32);
    } else {
      fill(colorNormal); // Color normal del botón
      stroke(bordeNormal);
      textSize(24);
    }
    rect(x, y, ancho, alto);

    if (mouseEncima()) {
      fill(bordeHover); // Cambia el color de la fuente
      textSize(32);
    } else {
      fill(bordeNormal); // Color normal
      textSize(24);
    }
    text(etiqueta, x + ancho/2, y + alto/2);
    
  
      return mouseEncima();
  
  }


  // Método para cambiar la fuente del texto del botón
  void setFuente(PFont nuevaFuente) {
    fuente = nuevaFuente;
  }
}
