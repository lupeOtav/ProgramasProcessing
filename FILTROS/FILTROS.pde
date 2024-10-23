PImage sprite;
PImage tempSprite;

void setup() {
  size(800, 600);
  sprite = loadImage("personaje.jpg");
  tempSprite = sprite.copy();
}

void draw() {
  background(255);
  fill(0);
  textSize(24);
  // Mostramos la imagen original sin filtro
  image(sprite, 0, 0, 200, 300);
  text("SIN FILTRO", 20, 290);

  tempSprite = sprite.copy();
  tempSprite.filter(GRAY);
  image(tempSprite, 200, 0, 200, 300);
  text("GRAY", 220, 290);

  fill(255);
  tempSprite = sprite.copy();
  tempSprite.filter(INVERT);
  image(tempSprite, 400, 0, 200, 300);
  text("INVERT", 420, 290);

  fill(0);
  tempSprite = sprite.copy();
  tempSprite.filter(THRESHOLD, 0.7);
  image(tempSprite, 600, 0, 200, 300);
  text("THRESHOLD", 620, 290);

  tempSprite = sprite.copy();
  tempSprite.filter(POSTERIZE, 2);
  image(tempSprite, 0, 300, 200, 300);
  text("POSTERIZE", 20, 590);

  tempSprite = sprite.copy();
  tempSprite.filter(BLUR, 9);
  image(tempSprite, 200, 300, 200, 300);
  text("BLUR", 220, 590);

  tempSprite = sprite.copy();
  tempSprite.filter(ERODE);
  image(tempSprite, 400, 300, 200, 300);
  text("ERODE", 420, 590);

  tempSprite = sprite.copy();
  tempSprite.filter(DILATE);
  image(tempSprite, 600, 300, 200, 300);
  text("DILATE", 620, 590);
}
