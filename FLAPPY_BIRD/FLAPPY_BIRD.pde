int birdSize = 80;
float birdY;
float velocity = 0;
float gravity = 0.7;
float lift = -2;
boolean gameover = false;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
PImage flapy;
PImage fondo;
PImage estalagtita;
PImage estalagmita;

void setup() {
  size(600, 400);
  flapy = loadImage("FLAPY.png");
  fondo = loadImage("fondo2.jpg");
  estalagtita = loadImage("estalagtita.png");
  estalagmita = loadImage("estalagmita.png");
  birdY = height / 2;
  obstacles.add(new Obstacle());
}

void draw() {
  image(fondo, 0, 0, 600, 400);
  if (!gameover) {
    if (keyPressed && (key == ' ' || keyCode == UP)) {
      velocity += lift;
    } else {
      velocity = 0;
    }

    velocity += gravity;
    birdY += velocity;

    image(flapy, 100, birdY, birdSize, birdSize);

    for (int i = obstacles.size()-1; i >= 0; i--) {
      obstacles.get(i).update();
      obstacles.get(i).show();

      // Verifica colisión
      if (obstacles.get(i).hits()) {
        gameover = true;
      }

      if (obstacles.get(i).offscreen()) {
        obstacles.remove(i);
      }
    }

    // Añade nuevos obstáculos
    if (frameCount % 75 == 0) {
      obstacles.add(new Obstacle());
    }
  } else {
    textSize(32);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Game Over", width/2, height/2);
  }
}

class Obstacle {
  float x;
  float gapY;
  float w = 20;
  float speed = 2;
  float gapSize = 200; // Brecha entre los rectángulos

  Obstacle() {
    x = width;
    w = random(20, 55);
    gapY = random(50, height - gapSize - 50);
  }

  void update() {
    x -= speed;
  }

  void show() {
    image(estalagtita, x, 0, w, gapY); // Rectángulo superior
    image(estalagmita, x, gapY + gapSize, w, height - gapY - gapSize);  // Dibuja la imagen reflejada
  }
  
  boolean hits() {
    if (100 > x && 100 < x + w) {
      if (birdY < gapY || birdY > gapY + gapSize) {
        return true;
      }
    }
    return false;
  }

  boolean offscreen() {
    if (x < -w) {
      return true;
    } else {
      return false;
    }
  }
}
