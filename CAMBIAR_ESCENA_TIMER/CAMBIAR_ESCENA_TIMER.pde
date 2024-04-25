PImage[] imagenes;
String[] textos;
int i = 0;
int j = 0;
int intervalo = 3000; // Intervalo de tiempo en milisegundos
int tiempoAnterior = 0;

void setup() {
  size(400, 400);
  imagenes = new PImage[] {
    loadImage("A1.jpg"),
    loadImage("A2.jpg"),
    loadImage("A3.jpg"),
    loadImage("A4.jpg"),
    loadImage("A5.jpg")
  };
  textos = new String[] {
    "Había una vez",
    "una casa en el campo",
    "que tenía arboles",
    "y unas montañas"
  };
 // setInterval("mostrarImagenes", 3000);
 // setInterval("mostrarTextos", 3000);
   tiempoAnterior = millis();
}

void mostrarTextos() {
  j++;
  if (j > 3) {
    j = 0;
  }
}

void mostrarImagenes() {
  i++;
  if (i > 4) {
    i = 0;
  }
}

void draw() {
  background(220);
    // Verificar si ha pasado el intervalo de tiempo
  if (millis() - tiempoAnterior > intervalo) {
    // Realizar acciones después del intervalo
    tiempoAnterior = millis(); // Restablecer el tiempo anterior
    mostrarImagenes();
    mostrarTextos();
  }
  
  image(imagenes[i], 0, 0, 400, 400);
  fill(0);
  stroke(0);
  textSize(32);
  text(textos[j], 100, 360);
}

void mousePressed() {
  i++;
  if (i > 4) {
    i = 0;
  }
}
