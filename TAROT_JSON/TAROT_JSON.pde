JSONObject cartas;
JSONObject cartaActual;
PImage[] imagenes;

void setup() {
  size(600, 600);
  textSize(18);

  imagenes = new PImage[23];
  imagenes[0] = loadImage("1carro.jpg");
  imagenes[1] = loadImage("1colgado.jpg");
  imagenes[2] = loadImage("1diablo.jpg");
  imagenes[3] = loadImage("1emperador.jpg");
  imagenes[4] = loadImage("1emperatriz.jpg");
  imagenes[5] = loadImage("1enamorados.jpg");
  imagenes[6] = loadImage("1ermitaño.jpg");
  imagenes[7] = loadImage("1estrella.jpg");
  imagenes[8] = loadImage("1fuerza.jpg");
  imagenes[9] = loadImage("1hierofante.jpg");
  imagenes[10] = loadImage("1juicio.jpg");
  imagenes[11] = loadImage("1justicia.jpg");
  imagenes[12] = loadImage("1loco.jpg");
  imagenes[13] = loadImage("1luna.jpg");
  imagenes[14] = loadImage("1mago.jpg");
  imagenes[15] = loadImage("1muerte.jpg");
  imagenes[16] = loadImage("1mundo.jpg");
  imagenes[17] = loadImage("1rueda.jpg");
  imagenes[18] = loadImage("1sacerdotiza.jpg");
  imagenes[19] = loadImage("1sol.jpg");
  imagenes[20] = loadImage("1templanza.jpg");
  imagenes[21] = loadImage("1torre.jpg");

  cartas = loadJSONObject("tarot.json");
}

void obtenerCartaAlAzar() {
  int indice = int(random(cartas.getJSONArray("cartas").size()));
  cartaActual = cartas.getJSONArray("cartas").getJSONObject(indice);
}

void mousePressed(){
  obtenerCartaAlAzar();
}
void draw() {
  background(220);

  // Aumentar el tamaño de la fuente y el espaciado entre líneas
  textSize(16);
  textLeading(20);
  textAlign(CENTER, TOP);

  // Mostrar la carta actual en el lienzo
  if (cartaActual != null) {
    stroke(255);
    strokeWeight(10);
    noFill();
    rect(width / 2 - 100, height / 4 - 100, 200, 300);

    // Dibujar imagen de la carta
    image(imagenes[cartaActual.getInt("imagen")], width / 2 - 100, height / 4 - 100, 200, 300);

    strokeWeight(3);
    rect(width / 2 - 95, height / 4 - 95, 190, 290);

    textSize(18);
    textAlign(CENTER, TOP);
    fill(0);
    text("Nombre: " + cartaActual.getString("nombre"), width / 2, height / 2 + 100);
    text("Significado:", width / 2, height / 2 + 140);
    text(cartaActual.getString("significado"), width / 2, height / 2 + 160);

   mostrarDescripcion(cartaActual.getString("descripcion"), width / 2, height / 2 + 200, 400);
  }
}

// Función para mostrar la descripción con envoltura de texto
void mostrarDescripcion(String descripcion, float x, float y, float ancho) {
  fill(0);
  int numLineas = ceil(textWidth(descripcion) / ancho);
  String[] lineas = new String[numLineas];
  int longitudMaxima = descripcion.length() / numLineas;
  
  for (int i = 0; i < numLineas; i++) {
    int inicio = i * longitudMaxima;
    int fin = min((i + 1) * longitudMaxima, descripcion.length());
    lineas[i] = descripcion.substring(inicio, fin);
  }
  for (int i = 0; i < numLineas; i++) {
    text(lineas[i], x, y + i * 20);
  }
}
