import processing.data.*;

JSONObject edificiosData;
ArrayList<Edificio> edificios = new ArrayList<Edificio>();
PImage fondo;
int edificioArrastrado = -1;
int pesos = 2000;
int madera = 600;
int piedra = 200;
String descripcionEdificio = "";
String nombreEdificio = "";
boolean mostrarDescripcion = false;
int tiempoAnterior = 0;
int intervalo = 3000;

void setup() {
  size(750, 600);
  fondo = loadImage("FONDO3.jpg");
  cargarEdificios();
}

void draw() {
  background(255);
  image(fondo, 0, 0, 450, 600);
  
  // Actualizar temporizador
  if (millis() - tiempoAnterior >= intervalo) { 
    tiempoAnterior = millis(); 
    for (Edificio e : edificios) {
      if (e.getEmplazado()) {
        pesos += e.producir();
      }
    }
  }
  
  for (Edificio e : edificios) {
    e.display();
  }

  if (mostrarDescripcion) {
    textSize(22);
    fill(0);
    text(nombreEdificio, 50, 500);
    textSize(18);
    text(descripcionEdificio, 50, 520, 400, 100);
  }
  fill(0);
  textSize(24);
  text("Pesos disponibles: " + pesos, 40, 40);
}

void mousePressed() {
  for (int i = 0; i < 22; i++) {
    if (edificios.get(i).clickeado(mouseX, mouseY)) {
      if (!edificios.get(i).getEmplazado()) {//solo puedo arrastrar un edificio que esta en el menu de la derecha
        if (pesos > edificios.get(i).pesosCosto) {
          edificioArrastrado = i;
          edificios.get(i).isDragging = true;
        } else {
         println("No alcanzan los pesos para comprar este edificio"); 
        }
      }
      mostrarDescripcion = true;
      nombreEdificio = edificios.get(i).getNombre();
      descripcionEdificio = edificios.get(i).getDescripcion();
      break;
    }
  }
}

void mouseReleased() {
  if (edificioArrastrado != -1) {
    edificios.get(edificioArrastrado).isDragging = false;
    edificioArrastrado = -1;
  }
}

void mouseDragged() {
  if (edificioArrastrado != -1) {
    if (edificios.get(edificioArrastrado).x < 450) { // Si está del lado izquierdo
      if (pesos > edificios.get(edificioArrastrado).pesosCosto) {
        pesos = pesos - edificios.get(edificioArrastrado).pesosCosto;
        edificios.get(edificioArrastrado).tamaño = 100; // Tamaño normal
        edificios.get(edificioArrastrado).emplazar();
      }
    }
    edificios.get(edificioArrastrado).x = mouseX;
    edificios.get(edificioArrastrado).y = mouseY;
  }
}

void cargarEdificios() {
  edificiosData = loadJSONObject("edificios.json");

  for (int i = 0; i < 22; i++) {
    JSONObject edificioData = edificiosData.getJSONArray("edificios").getJSONObject(i);

    String imagenPath = edificioData.getString("imagen");
    PImage imagen = loadImage(imagenPath);
    int ancho = edificioData.getInt("ancho");
    int alto = edificioData.getInt("alto");
    String nombre = edificioData.getString("nombre");
    String descripcion = edificioData.getString("descripcion");
    int pesosProducidos = edificioData.getInt("pesosProducidos");
    int pesosCosto = edificioData.getInt("pesosCosto");
    JSONArray recursosNecesariosArray = edificioData.getJSONArray("recursosNecesarios");

    // Convertir el JSONArray de recursosNecesarios a una cadena de texto
    StringBuilder recursosNecesarios = new StringBuilder();
    for (int j = 0; j < recursosNecesariosArray.size(); j++) {
      recursosNecesarios.append(recursosNecesariosArray.getString(j));
      if (j < recursosNecesariosArray.size() - 1) {
        recursosNecesarios.append(", "); // Agregar una coma y espacio si no es el último elemento
      }
    }

    Edificio nuevoEdificio = new Edificio(imagen, ancho, alto, 460 + (i % 4) * 70, 100 + (i / 4) * 102, nombre, descripcion, pesosProducidos, pesosCosto, recursosNecesarios.toString());
    edificios.add(nuevoEdificio);
  }
}
