PImage cofre1;
PImage cofre2;
PImage cofre3;
PImage cofre4;

int contadorClicks = 0;
int posx = 0;

float monedas = 0;
float gemas = 0;
float corazones = 0;
float cristales = 0;
float monedasAcum = 200;
float gemasAcum = 0;
float corazonesAcum = 0;
float cristalesAcum = 0;

boolean cofrePresionado = false;
boolean cofre1Abierto = false;
boolean cofre2Abierto = false;
boolean cofre3Abierto = false;
boolean cofre4Abierto = false;
boolean faltanMonedas = false;
boolean ayudaVisible = true;

void setup() {
  size(800, 700);
  cofre1 = loadImage("COFRE2.jpg");
  cofre2 = loadImage("COFRE3.jpg");
  cofre3 = loadImage("COFRE1.jpg");
  cofre4 = loadImage("COFRE4.jpg");
}

void draw() {
  background(0);
  fill(100);
  rect(0, 380, 800, 330);
  if (!cofre1Abierto) {
    image(cofre1, 0, 80, 200, 300);
  }
  if (!cofre2Abierto) {
    image(cofre2, 200, 80, 200, 300);
  }
  if (!cofre3Abierto) {
    image(cofre3, 400, 80, 200, 300);
  }
  if (!cofre4Abierto) {
    image(cofre4, 600, 80, 200, 300);
  }

  if (cofrePresionado) {
    strokeWeight(8);
    stroke(255, 0, 0);
    noFill();
    rect(posx, 80, 200, 300);
    strokeWeight(1);
    stroke(0);
    fill(160);
    rect(0, 590, 800, 200);
    fill(255);
    textSize(32);
    text("Aceptar cofre", 320, 650);
    fill(0);
    textSize(18);

    text("obtenes " + int(monedas) + " moneda/s", 320, 460);
    text("obtenes " + int(gemas) + " gema/s", 320, 490);
    text("obtenes " + int(corazones) + " corazon/es", 320, 520);
    text("obtenes " + int(cristales) + " cristal/es", 320, 550);
    text("Se gastaron 50 monedas", 20, 460);
  }

  fill(255);
  textSize(24);
  text("Monedas: " + int(monedasAcum), 40, 40);
  text("Gemas: " + int(gemasAcum), 240, 40);
  text("Corazones: " + int(corazonesAcum), 440, 40);
  text("Cristales: " + int(cristalesAcum), 640, 40);
  fill(255, 240, 0);
  rect(25, 28, 10, 10);
  fill(255, 0, 230);
  rect(225, 28, 10, 10);
  fill(255, 0, 0);
  rect(425, 28, 10, 10);
  fill(0, 255, 255);
  rect(625, 28, 10, 10);

  fill(0);
  text("Contador de intentos: " + contadorClicks, 20, 430);

  if (ayudaVisible) {

    fill(255, 255, 0);
    rect(0, 80, 800, 450);
    fill(0);
    text("En este ejemplo hay cuatro cofres disponibles. \n Hay multiples intentos pero cada uno cuesta 50 monedas. \n Si podes abrí los cuatro cofres. \n Pero cuidado que las monedas se van gastando. \n Un intento se gasta al hacer click sobre un cofre. \n Cada intento modifica los premios a recibir para el cofre seleccionado. \n Para ganar los premios solo hacer clic en Aceptar cofre.", 60, 160);
  }
  if (faltanMonedas){
     fill(255);
     textSize(32);
    text("Faltan monedas,  \nson necesarias 50", 60,490);
  }
}

void mousePressed() {
  if (ayudaVisible) {
    ayudaVisible = false;
    return;
  }
  if(monedasAcum < 50){
    faltanMonedas =true;
  }
  if (mouseY > 80 && mouseY < 380) {
    if (mouseX > 0 && mouseX <= 200 && !cofre1Abierto && monedasAcum >=50) {
      posx=0;
      cofrePresionado = true;
    } else if (mouseX > 200 && mouseX <= 400 && !cofre2Abierto && monedasAcum >=50) {
      posx=200;
      cofrePresionado = true;
    } else if (mouseX > 400 && mouseX <= 600 && !cofre3Abierto && monedasAcum >=50) {
      posx=400;
      cofrePresionado = true;
    } else if (mouseX > 600 && mouseX <= 800 && !cofre4Abierto && monedasAcum >=50) {
      posx=600;
      cofrePresionado = true;
    }

    if (cofrePresionado && monedasAcum >=50) {
      contadorClicks++;
      monedasAcum = monedasAcum - 50;
      monedas = int(random(0, 50));
      gemas = int(random(0, 5));
      corazones = int(random(1, 5));
      cristales = int(random(0, 50));
    }
  } else if (mouseY > 510) {//boton aceptar
    if (cofrePresionado) {
      monedasAcum = monedasAcum + monedas;
      gemasAcum = gemasAcum + gemas;
      corazonesAcum = corazonesAcum + corazones;
      cristalesAcum = cristalesAcum + cristales;
      cofrePresionado = false;

      if (posx == 0) {
        cofre1Abierto = true;
      }
      if (posx == 200) {
        cofre2Abierto = true;
      }
      if (posx == 400) {
        cofre3Abierto = true;
      }
      if (posx == 600) {
        cofre4Abierto = true;
      }
    }
  }
}
