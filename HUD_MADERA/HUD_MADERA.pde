PImage fondo;
PImage[] elementos = new PImage[19];
PFont miFuente;
int objetoSeleccionado = 2;
String[] textos = new String[8];
String mensaje = "";
boolean objetoListo = false;

void setup() {
  size(800, 600);
  //fondo = loadImage("q2.jpg");

  miFuente = createFont("IMFell.ttf", 24);
  //miFuente = createFont("Cinzel.ttf", 24);
  //miFuente = createFont("Medieval.ttf", 24);
  //miFuente = createFont("PirataOne.ttf", 24);
  //miFuente = createFont("Unifraktur.ttf", 24);

  for (int j = 0; j < 19; j++) {
    elementos[j] = loadImage("t" + (j + 1) + ".png");
  }
  textAlign(CENTER);
  textos[0] ="Tablas de \nmadera \nmisteriosa";
  textos[1] ="Escudo de \npuerco espin";
  textos[2] ="Escudo de \nelite dorado";
  textos[3] ="Escudo de \nguerrero";
  textos[4] ="Madera \npara balsa";
  textos[5] ="Soporte \npara \nalimentos";
  textos[6] ="Jarro para \nel agua";
  textos[7] ="Armas \nversatiles";
}

void draw() {
  background(190, 190, 160);
  textFont(miFuente);
  //image(fondo, 0, 0, 400, 600);
  strokeWeight(5);
  stroke(156, 127, 95);
  fill(120, 130, 170, 100);
  rect(310, 180, 450, 250);

  if (!objetoListo) {
    int x = 320;
    int y = 190;

    for (int j = 2; j<10; j++) {
      image( elementos[floor(j)], x, y, 100, 100);
      x += 110;
      if (x > 750) {
        y += 130;
        x = 320;
      }
    }
  }
  image( elementos[0], 20, 120, 290, 440);
  image( elementos[1], 20, 20, 760, 110);
  image( elementos[11], 390, 460, 300, 70);
  image( elementos[15], 420, 470, 40, 50);

  textSize(48);
  fill(0);

  text("Elegí bien alguno de estos", 380, 90);
  text("Aceptar", 560, 510);

  image(elementos[objetoSeleccionado], 110, 220, 100, 100);
  textSize(24);
  text(textos[objetoSeleccionado - 2], 160, 340);
  text(mensaje, 560, 560);
}

void mousePressed() {
  int x = 320;
  int y = 190;
  if (!objetoListo) {
    for ( int j = 2; j < 10; j++) {
      if (mouseX > x && mouseX < x +100 && mouseY > y && mouseY < y+100) {
        objetoSeleccionado = j;
        break;
      }
      x += 110;
      if (x > 750) {
        y += 130;
        x = 320;
      }
    }
  }
  if (mouseX > 390 && mouseX < 690  && mouseY > 460 && mouseY < 530) {
    if (!objetoListo) {
      mensaje ="Excelente, el objeto ya es tuyo \ny aparecerá en tu inventario";
      objetoListo = true;
    } else {
      mensaje="El objeto ya es tuyo";
    }
  }
}
