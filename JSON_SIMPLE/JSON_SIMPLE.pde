JSONObject data; // Variable para almacenar los datos del archivo JSON
int i = 0; // Índice de la ciudad actual a mostrar
int rectX = 190; // Posición X del rectángulo
int rectY = 300; // Posición Y del rectángulo
int rectW = 100; // Ancho del rectángulo
int rectH = 40; // Alto del rectángulo
boolean rectPresionado = false; // Variable para verificar si se presionó el rectángulo
PImage[] fondos; // Array de imágenes de fondo para cada ciudad

void setup() {
  size(400, 400);
  textAlign(CENTER);
  textSize(16);

  // Cargar el archivo JSON
  data = loadJSONObject("ciudades.json");

  rectMode(CENTER); // Establecer el modo de rectángulo al centro

  // Cargar las imágenes de fondo para cada ciudad
  JSONArray ciudades = data.getJSONArray("ciudades");
  fondos = new PImage[ciudades.size()];
  for (int i = 0; i < ciudades.size(); i++) {
    fondos[i] = loadImage(ciudades.getJSONObject(i).getString("imagen"));
  }
}

void draw() {
  // Mostrar la imagen de fondo correspondiente a la ciudad actual
  image(fondos[i], 0, 0, width, height);
  fill(180, 160, 200, 130);
  rect(200, 200, 200, 250);
  // Obtener la ciudad actual
  JSONObject currentCity = data.getJSONArray("ciudades").getJSONObject(i);

  // Mostrar los datos de la ciudad actual
  fill(255);
  textSize(24);

  text("Pais: " + currentCity.getString("nombre"), width / 2, height / 2 - 60);
  fill(0);
  textSize(18);

  text("Fauna: " + join(currentCity.getJSONArray("fauna").getStringArray(), ", "), width / 2, height / 2 - 30);
  text("Flora: " + join(currentCity.getJSONArray("flora").getStringArray(), ", "), width / 2, height / 2);
  text("Clima: " + currentCity.getString("clima"), width / 2, height / 2 + 30);
  text("Región: " + currentCity.getString("region"), width / 2, height / 2 + 60);

  // Dibujar el rectángulo
  fill(200); // Color gris claro
  rect(rectX, rectY, rectW, rectH);
  fill(0);

  text("Siguiente", rectX + 10, rectY + 10, rectW, rectH);
}

void mousePressed() {
  // Verificar si el mouse está dentro del rectángulo
  if (mouseX > rectX - rectW/2 && mouseX < rectX + rectW/2 &&
    mouseY > rectY - rectH/2 && mouseY < rectY + rectH/2) {
    rectPresionado = true;
    nextCity(); // Llamar a la función nextCity si se presiona el rectángulo
  } else {
    rectPresionado = false;
  }
}

void nextCity() {
  // Avanzar al siguiente índice de la ciudad
  i++;

  // Comprobar si hemos llegado al final de la lista de ciudades
  if (i >= data.getJSONArray("ciudades").size()) {
    i = 0; // Volver al inicio
  }
}
