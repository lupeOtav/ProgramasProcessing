PImage sprite;

void setup() {
  size(900, 300);
  sprite = loadImage("persona.jpg");
  sprite.filter(GRAY);  // Convertir a escala de grises para mayor efecto
}

void draw() {
  background(255);
  fill(0, 255, 0);
  textSize(24);
  // Imagen original en escala de grises
  image(sprite, 0, 0, 300, 300);
  text("ORIGINAL", 20, 290);

  PImage erodeImg = sprite.copy();
  erodeImg.filter(ERODE);//suaviza las altas luces de una foto
  erodeImg.filter(ERODE);//esta repetido para que se note mejor el efecto
  erodeImg.filter(ERODE);
  image(erodeImg, 300, 0, 300, 300);
  text("ERODE", 320, 290);

  PImage dilateImg = sprite.copy();
  dilateImg.filter(DILATE);//expande las altas luces de una foto
  dilateImg.filter(DILATE);
  dilateImg.filter(DILATE);
  image(dilateImg, 600, 0, 300, 300);
  text("DILATE", 620, 290);
}
