import processing.sound.*;

String[] palabras = {
  "¡INCREÍBLE!",
  "ÉPICO",
  "REVOLUCIONARIO",
  "¡IMPRESIONANTE!",
  "NUNCA ANTES VISTO",
  "¡INIGUALABLE!",
  "TOTALMENTE NUEVO",
  "ESPECTACULAR",
  "¡SORPRENDENTE!",
  "ASOMBROSO",
  "¡WOW!",
  "SENSACIONAL",
  "¡ALUCINANTE!",
  "MAGISTRAL",
  "¡TREMENDO!"
};

String[] frases = {
  "Este curso cambiará tu vida...",
  "Preparate...",
  "Todas las transiciones...",
  "¡Más allá de la imaginación!",
  "Efectos especiales",
  "¡La aventura comienza hoy!",
  "Dale vuelo a tus imágenes",
  "El ejemplo que esperabas...",
  "Recortá partes",
  "Más emoción...",
  "Deslizá...",
  "¡Todo lo que necesitas!",
  "Hay muchos mas",
  "Disolvé los pixeles",
  "¡Tu futuro empieza ahora!",
  "Efectos de máscara",
  "¡El curso que cambiará todo!"
};
SoundFile musica;
PFont miFuente;
int palabraActual = 0;
int fraseActual = 0;
int i = 0;
int espera = 3;
int momento = 0;
int transicion = 0;
int duracionEspera = 2000;
int tiempoInicio;
PImage fondo;
PImage imagen1;
PImage imagen2;

//variables para las transiciones
float zoomFactor = 1.0;
int alfa = 0;
int alfa1 = 255;
int alfa2 = 0;
boolean mostrarImagen1= true;
float offsetX = 0; // Desplazamiento inicial en el eje X para pan
float offsetXDerecha = width - 338;
float panSpeed = 2; // Velocidad de paneo
float wipePositionH = 0;
float wipePositionV = 0;
float wipeSpeed = 25;
float slidePosition = 1024; // Posición inicial del slide
float slideSpeed = 55; // Velocidad del slide
float slidePosition2 = -1024; // Comienza desde el lado izquierdo de la ventana
float angle = 0; // Ángulo inicial de rotación
float spinSpeed = 0.06; // Velocidad de rotación
float radius = 0; // Radio inicial del círculo
float maxRadius; // Radio máximo del círculo (diagonal de la ventana)
float irisSpeed = 35; // Velocidad de expansión del círculo
int dissolveSpeed = 45500; // Número de píxeles que se disuelven por frame
boolean[] pixelsDissolved; // Array para marcar qué píxeles se han disuelto
PImage img;
PImage img0;
PImage img1;
PImage img2;

void setup() {
  size(800, 600);
  musica = new SoundFile(this, "sonido.mp3");
  musica.loop();
  fondo = loadImage("fondo.jpg");
  imagen1 = loadImage("b.jpg");
  imagen2 = loadImage("a.jpg");
  img = imagen1.copy();
  img0 = imagen2.copy();
  img1 = imagen1.copy();
  img2 = imagen2.copy();
  pixelsDissolved = new boolean[imagen1.width * imagen1.height];
  for (int i = 0; i < pixelsDissolved.length; i++) {
    pixelsDissolved[i] = false; // Marca todos los píxeles como no disueltos
  }

  textAlign(CENTER, CENTER);
  miFuente = createFont("Amatic.ttf", 32);
  frameRate(30);
  tiempoInicio = millis();
  maxRadius = dist(0, 0, width, height);
}

void draw() {
  background(0);
  image(fondo, 0, 0, 800, 600);
  fill(255);
  int tiempoActual = millis();
  int tiempoTranscurrido = tiempoActual - tiempoInicio;

  /* Hay 4 momentos:
   uno en que muestra una palabra grande que se va achicando,
   otro donde se va tipeando una frase,
   otro donde muestra alguna de transicion,
   otro donde solo se prepara para cambiar la proxima transicion
   */
  switch (momento) {
  case 0:
    float scaleFactor = map(tiempoTranscurrido, 0, duracionEspera, 5, 1); // De grande a tamaño normal

    textFont(miFuente, 62 * scaleFactor);
    text(palabras[palabraActual], width / 2, height / 2);
    if (tiempoTranscurrido > duracionEspera) {
      momento = 1;
      tiempoInicio = millis();
      palabraActual = (palabraActual + 1) % palabras.length;
    }
    break;

  case 1:
    textFont(miFuente, 48);
    String mensaje = frases[fraseActual];
    if (i < mensaje.length()) {
      if (frameCount % espera == 0 ) {
        i++;
      }
      tiempoInicio = millis();
    } else {
      if (tiempoTranscurrido > duracionEspera/2) {
        momento = 2;
        tiempoInicio = millis();
        fraseActual = (fraseActual + 1) % frases.length;
        i = 0;
      }
    }
    text(mensaje.substring(0, i), width / 2, height / 2);
    break;

  case 2:
    if (tiempoTranscurrido > duracionEspera + 2000) {
      momento = 3;
      tiempoInicio = millis();
    }
    break;

  case 3:
    transicion++;
    momento = 0;
    break;
  }
  /* Si es el momento de mostrar una transicion veo cual es la que corresponde
   son 16 y el default que es un fondo negro.
   */
  if (momento == 2) {
    switch(transicion) {
    case 0:
      zoom(0.01, true, imagen1);
      break;
    case 1:
      zoom(0.01, false, imagen2);
      break;
    case 2:
      fade(5, true, imagen1);
      break;
    case 3:
      fade(3, false, imagen2);
      break;
    case 4:
      crossFade(10, imagen1, imagen2);
      break;
    case 5:
      cut(imagen1, imagen2);
      break;
    case 6:
      pan(true, imagen1);
      break;
    case 7:
      pan(false, imagen2);
      break;
    case 8:
      wipe(true, imagen1, imagen2);
      break;
    case 9:
      wipe(false, imagen2, imagen1);
      break;
    case 10:
      slide( true, imagen1, imagen2);
      break;
    case 11:
      slide( false, imagen2, imagen1);
      break;
    case 12:
      spin(imagen1);
      break;
    case 13:
      dissolve();
      break;
    case 14:
      iris(true);
      break;
    case 15:
      iris(false);
      break;
    default:
      background(0);
      textFont(miFuente, 28);
      fill(255, 0, 0);
      text("Fin de los ejemplos", 650, 500);
    }
  }
}

/*Todas las transiciones estan separadas en distintos subalgoritmos
 para que sean independientes entre sí */

void dissolve() {
  image(img1, 0, 0);
  for (int i = 0; i < dissolveSpeed; i++) {
    int x = int(random(img1.width));
    int y = int(random(img1.height));
    int index = x + y * img1.width;
    if (!pixelsDissolved[index]) {
      img1.set(x, y, img2.get(x, y));
      pixelsDissolved[index] = true;
    }
  }

  // Actualiza la ventana con la imagen disuelta
  updatePixels();
  textFont(miFuente, 38);
  text("Dissolve", 650, 500);
  textFont(miFuente, 32);
  fill(255, 255, 0);
  text("Disolución", 650, 530);
}

void iris(boolean opcionIn) {
  if (opcionIn) {
    image(img, 0, 0, width, height);
    // Crea una máscara en forma de círculo
    PGraphics mask = createGraphics(img.width, img.height);
    mask.beginDraw();
    mask.background(0);
    mask.noStroke();
    mask.fill(255);
    mask.ellipse(img.width / 2, img.height / 2, radius * 2, radius * 2);
    mask.endDraw();
    img.mask(mask);
    image(img, 0, 0, width, height);


    radius += irisSpeed;
    if (radius > maxRadius) {
      radius = maxRadius;
    }
    textFont(miFuente, 38);
    text("Iris in", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Iris de entrada", 650, 530);
  } else {
    image(img0, 0, 0, width, height);
    // Crea una máscara en forma de círculo
    PGraphics mask = createGraphics(img.width, img.height);
    mask.beginDraw();
    mask.background(0);
    mask.noStroke();
    mask.fill(255);
    mask.ellipse(img0.width / 2, img0.height / 2, radius * 2, radius * 2);
    mask.endDraw();
    img0.mask(mask);
    image(img0, 0, 0, width, height);

    radius -= irisSpeed;
    if (radius < 0) {
      radius = 0;
    }
    textFont(miFuente, 38);
    text("Iris out", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Iris de salida", 650, 530);
  }
}
void spin(PImage img) {
  push();
  translate(width / 2, height / 2);
  rotate(angle);
  imageMode(CENTER);
  image(img, 0, 0, img.width * 1.3, img.height *1.3);
  pop();
  angle += spinSpeed;
  if (angle > TWO_PI) {
    angle -= TWO_PI;
  }
  textFont(miFuente, 38);
  text("Spin", 650, 500);
  textFont(miFuente, 32);
  fill(255, 255, 0);
  text("Giro", 650, 530);
}

void slide(boolean opcionIz, PImage img1, PImage img2) {

  if (opcionIz) {
    image(img1, 0, 0, width, height);
    image(img2, slidePosition, 0, width, height);
    slidePosition -= slideSpeed;
    if (slidePosition < 0) {
      slidePosition = 0;
    }
    textFont(miFuente, 38);
    text("Slide", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Desplazamiento a la izquierda", 650, 530);
  } else {
    image(img1, 0, 0, width, height);
    image(img2, slidePosition2, 0, width, height);
    slidePosition2 += slideSpeed; // Mueve hacia la derecha
    if (slidePosition2 > 0) {
      slidePosition2 = 0;
    }
    textFont(miFuente, 38);
    text("Slide", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Deslizamiento a la derecha", 650, 530);
  }
}

void wipe(boolean opcionHorizontal, PImage img1, PImage img2) {
  if (opcionHorizontal) {
    image(img1, 0, 0, width, height);
    copy(img2, 0, 0, int(wipePositionH), height, 0, 0, int(wipePositionH), height);
    wipePositionH += wipeSpeed;
    if (wipePositionH > width) {
      wipePositionH = width;
    }
    textFont(miFuente, 38);
    text("Wipe", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Barrido horizontal", 650, 530);
  } else {
    image(img1, 0, 0, width, height);
    copy(img2, 0, 0, width, int(wipePositionV), 0, 0, width, int(wipePositionV));
    wipePositionV += wipeSpeed;
    if (wipePositionV > width) {
      wipePositionV = width;
    }
    textFont(miFuente, 38);
    text("Wipe", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Barrido vertical", 650, 530);
  }
}

void pan(boolean opcionIz, PImage img) {
  if (opcionIz) {
    image(img, -offsetX, 0);
    offsetX += panSpeed;
    if (offsetX > img.width) {
      offsetX = 0;
    }
    textFont(miFuente, 38);
    fill(255);
    text("Pan", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Paneo horizontal", 650, 530);
  } else {
    image(img, offsetXDerecha, 0);
    offsetXDerecha += panSpeed;
    if (offsetXDerecha < -img.width) {
      offsetXDerecha = width - 238;
    }
    textFont(miFuente, 38);
    fill(255);
    text("Pan", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Paneo ", 650, 530);
  }
}
void cut(PImage img1, PImage img2) {
  if (frameCount % espera == 0 ) {
    mostrarImagen1 = !mostrarImagen1;
  }
  if (mostrarImagen1) {
    image(img1, 0, 0, width, height);
  } else {
    image(img2, 0, 0, width, height);
  }
  textFont(miFuente, 38);
  fill(255);
  text("Cut", 650, 500);
  textFont(miFuente, 32);
  fill(255, 255, 0);
  text("Corte", 650, 530);
}

void crossFade(int delta, PImage img1, PImage img2) {
  push();
  tint(255, alfa1);
  image(img1, 0, 0, width, height);
  tint(255, alfa2);
  image(img2, 0, 0, width, height);
  pop();
  textFont(miFuente, 38);
  fill(255);
  text("Crossfade", 650, 500);
  textFont(miFuente, 32);
  fill(255, 255, 0);
  text("Fundido cruzado", 650, 530);
  alfa1 -= delta;
  alfa2 += delta;

  // Limita los valores de transparencia entre 0 y 255
  alfa1 = constrain(alfa1, 0, 255);
  alfa2 = constrain(alfa2, 0, 255);
}

void fade(float deltaFade, boolean opcionIn, PImage img) {
  background(0);
  tint(255, alfa);
  image(img, width/2 - img.width/2, height/2 - img.height/2);
  noTint();
  if (opcionIn) {
    textFont(miFuente, 38);
    text("Fade in", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Fundido de entrada", 650, 530);
    alfa += deltaFade;
    if (alfa > 255) {
      alfa = 255;
    }
  } else {
    textFont(miFuente, 38);
    text("Fade out", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Fundido de salida", 650, 530);
    alfa -= deltaFade;
    if (alfa < 0) {
      alfa = 0;
    }
  }
}

void zoom(float deltaZoom, boolean opcionIn, PImage img) {
  float imgWidth = img.width * zoomFactor;
  float imgHeight = img.height * zoomFactor;
  float x = (width - imgWidth) / 2;
  float y = (height - imgHeight) / 2;

  image(img, x + 90, y - 10, imgWidth, imgHeight);
  textFont(miFuente, 38);
  fill(255);
  if (opcionIn) {
    text("Zoom in", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Acercamiento", 650, 530);
    zoomFactor += deltaZoom;
    if (zoomFactor > 2.0) {
      zoomFactor = 2.0;
    }
  } else {
    text("Zoom out", 650, 500);
    textFont(miFuente, 32);
    fill(255, 255, 0);
    text("Alejamiento", 650, 530);
    zoomFactor -= deltaZoom;
    if (zoomFactor < 0.1) {
      zoomFactor = 0.1;
    }
  }
}
