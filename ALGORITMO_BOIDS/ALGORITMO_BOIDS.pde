ArrayList<Pez> peces = new ArrayList<Pez>();
int numPeces = 12;
PImage[] fotogramas = new PImage[6];
PImage mar;
boolean pantallaCompleta = false; // Estado de pantalla completa

void setup() {
  size(800, 600);
  mar = loadImage("mar3.jpg");
  
  // Cargar las imágenes de los peces
  fotogramas[0] = loadImage("f1.png");
  fotogramas[1] = loadImage("f2.png");
  fotogramas[2] = loadImage("f3.png");
  fotogramas[3] = loadImage("f4.png");
  fotogramas[4] = loadImage("f5.png");
  fotogramas[5] = loadImage("f6.png");

  for (int i = 0; i < numPeces; i++) {
    peces.add(new Pez(random(width), random(height), random(6)));
  }
}

void draw() {
  background(0, 150, 200); // Fondo simulando agua
  image(mar, 0, 0, width, height); // Ajustar imagen de fondo al tamaño actual del canvas

  for (Pez pez : peces) {
    pez.flock(peces);
    pez.update();
    pez.show();
  }
}


// Clase Pez basada en Boids
class Pez {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxForce = 0.2; // Máxima fuerza (ajustar para suavidad)
  float maxSpeed = 3;   // Máxima velocidad
  float size = 60;      // Tamaño inicial del pez
  float baseSize = 60;  // Tamaño base inicial
  float subIndice;      // Índice para la animación
  float velocidad = 0.2;

  Pez(float x, float y, float subIndice) {
    this.position = new PVector(x, y);
    this.velocity = PVector.random2D();
    this.velocity.setMag(random(2, 4));
    this.acceleration = new PVector();
    this.subIndice = subIndice;
  }

  // Actualiza la posición
  void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxSpeed);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // Reiniciar la aceleración
    edges(); // Evitar que los peces se salgan del canvas
  }

  // Muestra la imagen del pez
  void show() {
    push();
    translate(this.position.x, this.position.y);
    rotate(this.velocity.heading());
    image(fotogramas[floor(this.subIndice)], -this.size / 2, -this.size / 2, this.size, this.size); // Centrar la imagen del pez
    this.subIndice += this.velocidad;
    if (this.subIndice > 5) {
      this.subIndice = 0;
    }
    pop();
  }

  // Aplica las reglas del algoritmo de Boids
  void flock(ArrayList<Pez> peces) {
    PVector align = alinear(peces);
    PVector cohesion = cohesion(peces);
    PVector separation = separacion(peces);

    // Ajustar las influencias de cada comportamiento
    align.mult(1.0);
    cohesion.mult(1.0);
    separation.mult(1.5); // Separación tiene más peso para evitar amontonamientos

    this.acceleration.add(align);
    this.acceleration.add(cohesion);
    this.acceleration.add(separation);
  }

  // Alineación: ajusta la dirección con los otros peces
  PVector alinear(ArrayList<Pez> peces) {
    float rango = 50; // Distancia de influencia
    PVector steer = new PVector();
    int total = 0;
    for (Pez otro : peces) {
      float d = dist(this.position.x, this.position.y, otro.position.x, otro.position.y);
      if (otro != this && d < rango) {
        steer.add(otro.velocity);
        total++;
      }
    }
    if (total > 0) {
      steer.div(total);
      steer.setMag(this.maxSpeed);
      steer.sub(this.velocity);
      steer.limit(this.maxForce);
    }
    return steer;
  }

  // Cohesión: mueve al pez hacia el centro de los otros peces y ajusta el tamaño
  PVector cohesion(ArrayList<Pez> peces) {
    float rango = 50;
    PVector steer = new PVector();
    int total = 0;
    for (Pez otro : peces) {
      float d = dist(this.position.x, this.position.y, otro.position.x, otro.position.y);
      if (otro != this && d < rango) {
        steer.add(otro.position);
        total++;
      }
    }
    if (total > 0) {
      steer.div(total);
      steer.sub(this.position);
      steer.setMag(this.maxSpeed);
      steer.sub(this.velocity);
      steer.limit(this.maxForce);

      // Ajustar el tamaño del pez en función del número de peces cercanos
      this.size = this.baseSize + total * 5; // Cuantos más peces cerca, más grande es el pez
    } else {
      // Volver al tamaño base si no hay peces cerca
      this.size = this.baseSize;
    }

    return steer;
  }

  // Separación: evita que los peces se amontonen
  PVector separacion(ArrayList<Pez> peces) {
    float rango = 25;
    PVector steer = new PVector();
    int total = 0;
    for (Pez otro : peces) {
      float d = dist(this.position.x, this.position.y, otro.position.x, otro.position.y);
      if (otro != this && d < rango) {
        PVector diff = PVector.sub(this.position, otro.position);
        diff.div(d * d);
        steer.add(diff);
        total++;
      }
    }
    if (total > 0) {
      steer.div(total);
    }
    if (steer.mag() > 0) {
      steer.setMag(this.maxSpeed);
      steer.sub(this.velocity);
      steer.limit(this.maxForce);
    }
    return steer;
  }

  // Limita los peces dentro del canvas
  void edges() {
    if (this.position.x > width) this.position.x = 0;
    if (this.position.x < 0) this.position.x = width;
    if (this.position.y > height) this.position.y = 0;
    if (this.position.y < 0) this.position.y = height;
  }
}
