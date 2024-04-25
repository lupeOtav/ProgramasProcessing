JSONObject preguntas;
int preguntaIndex = 0;
int respuestaSeleccionada = -1;
int respuestaAnterior = -1;
String mensaje = "";
boolean incorrecta = false;
boolean fin = false;

void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);

  preguntas = loadJSONObject("preguntas.json");
}

void draw() {
  background(220);

 dibujarBotonSiguiente();

 dibujarGuardas();
 
  fill(0);
  if (preguntas.getJSONArray("preguntas").size() > 0) {
    JSONObject pregunta = preguntas.getJSONArray("preguntas").getJSONObject(preguntaIndex);

    textSize(24);
    text(pregunta.getString("pregunta"), width / 2, 60);

    textSize(20);
    JSONArray opciones = pregunta.getJSONArray("opciones");
    for (int i = 0; i < opciones.size(); i++) {
      int y = 100 + i * 40;

      if (respuestaSeleccionada == i) {
        if (incorrecta) {
          fill(255, 0, 0); // Resaltar la respuesta mal
        } else {
          fill(0, 255, 0); // Resaltar la respuesta bien
        }
      } else {
        if (respuestaAnterior == i) {
          fill(255, 0, 0); // Resaltar la respuesta mal
        } else {
          fill(0); // Color normal de las respuestas (negro)
        }
      }
      text(opciones.getString(i), width / 2, y);
    }
  }

  textSize(20);
  fill(0); // Color del mensaje (negro)
  text(mensaje, width / 2, height - 80);

  if (preguntaIndex == preguntas.getJSONArray("preguntas").size() - 1) {
    fill(200);
    rect(width / 2 - 50, height - 60, 100, 40);
    fill(0);
    textSize(18);
    text("Finalizar", width / 2 - 10, height - 40);
  }
  if (fin) {
    push();
    noStroke();
    fill(255, 200, 100);
    rect(60, 250, 520, 100);
    fill(255);
    textSize(24);
    text("Se terminaron las preguntas", 300, 300);
    pop();
  }
  line(200, 350, 400, 350);
}

void mousePressed() {
  if (preguntas.getJSONArray("preguntas").size() > 0 && (respuestaSeleccionada == -1 || respuestaAnterior != -1)) {
    JSONObject pregunta = preguntas.getJSONArray("preguntas").getJSONObject(preguntaIndex);
    for (int i = 0; i < pregunta.getJSONArray("opciones").size(); i++) {
      int y = 100 + i * 40;
      if (mouseX > width / 2 - 100 && mouseX < width / 2 + 100 && mouseY > y - 20 && mouseY < y + 20) {
        respuestaSeleccionada = i;
        verificarRespuesta(pregunta);
        break;
      }
    }
  }

    // Verificar si el clic del mouse ocurrió dentro del rectángulo del botón
    if  (mouseX > 200 && mouseX < 400 && mouseY > 350 && mouseY < 480) {
      pasarSiguientePregunta();
    }
  
}

void pasarSiguientePregunta() {
  if (mensaje != "¡Correcto!") {
    return;
  }
  if (preguntaIndex < preguntas.getJSONArray("preguntas").size() - 1) {
    preguntaIndex++;
    respuestaSeleccionada = -1;
    respuestaAnterior = -1;
    mensaje = "";
  } else {
    println("Fin del juego");
    fin = true;
  }
}

void verificarRespuesta(JSONObject pregunta) {
  if (respuestaSeleccionada == pregunta.getInt("respuesta_correcta")) {
    mensaje = "¡Correcto!";
    incorrecta = false;
    respuestaAnterior = -1;
  } else {
    mensaje = "Incorrecto";
    mostrarPista(pregunta);
    incorrecta = true;
    respuestaAnterior = respuestaSeleccionada;
  }
}

void mostrarPista(JSONObject pregunta) {
  String pista;

  if (random(1) < 0.5) {
    pista = pregunta.getString("pista_1");
  } else {
    pista = pregunta.getString("pista_2");
  }

  mensaje += ". Pista: " + pista;
}

void dibujarGuardas(){
   // Guarda de colores en la parte superior
  for (int x = 0; x < width; x += 10) {
    fill((int)random(255), (int)random(255), (int)random(255));
    rect(x, 10, 10, 10);
  }

  // Guarda de colores en la parte inferior
  for (int x = 0; x < width; x += 10) {
    fill((int)random(255), (int)random(255), (int)random(255));
    rect(x, height - 10, 10, 10);
  }
}

void dibujarBotonSiguiente(){
    fill(200);
  rect(width / 2 - 50, height - 60, 100, 40);
  fill(0);
  textSize(18);
  text("Siguiente", width / 2 - 10, height - 40);
}
