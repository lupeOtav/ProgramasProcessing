class Menu {
  int x, y; // Posición del menú
  int anchoVentana, altoVentana; // Ancho y alto de la ventana
  int cantidadBotones; // Cantidad de botones en el menú
  int altoBoton; // Alto de cada botón
  String[] etiquetas; // Texto de cada botón
  Boton[] botones; // Array de botones

  // Constructor
  Menu(int posX, int posY, int wVentana, int hVentana, int cantBotones, int hBoton, String[] textoBotones) {
    x = posX;
    y = posY;
    anchoVentana = wVentana;
    altoVentana = hVentana;
    cantidadBotones = cantBotones;
    altoBoton = hBoton;
    etiquetas = textoBotones;
    botones = new Boton[cantidadBotones];

    // Crear los botones
    for (int i = 0; i < cantidadBotones; i++) {
      int botonX = x + i * (anchoVentana / cantidadBotones); // Espacio equitativo entre botones
      botones[i] = new Boton(botonX, y, anchoVentana / cantidadBotones, altoBoton, etiquetas[i]);
    }
  }

  String clickeado() {
    for (int i = 0; i < cantidadBotones; i++) {
      if (botones[i].clickeado()) {
        return botones[i].etiqueta;
      }
    }
    return null; // Si ningún botón fue clickeado
  }
  
  // Mostrar el menú y los botones
  void mostrar() {
    for (int i = 0; i < cantidadBotones; i++) {
      botones[i].mostrar();
    }
  }
}
