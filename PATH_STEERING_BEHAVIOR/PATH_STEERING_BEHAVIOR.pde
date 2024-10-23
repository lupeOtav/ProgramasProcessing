PImage casa;
ArrayList<NPC> npcs = new ArrayList<>();
int numNPCs = 20;
Path path;



void setup() {
  size(800, 800);
  casa = loadImage("casita.png");
  // Crear la ruta
  path = new Path();
  path.addPoint(100, 100);
  path.addPoint(300, 300);
  path.addPoint(500, 200);
  path.addPoint(700, 400);
  path.addPoint(600, 600);
  path.addPoint(400, 700);
  path.addPoint(200, 500);
  
  // Crear NPCs
  for (int i = 0; i < numNPCs; i++) {
    npcs.add(new NPC(random(width), random(height)));
  }
}

void draw() {
  background(51);
  
  // Dibujar la ruta
  path.display();
  
  // Actualizar y dibujar NPCs
  for (NPC npc : npcs) {
    npc.followPath(path);  // Hacer que sigan el camino
    npc.update();
    npc.edges();  // Mantener a los NPCs dentro del canvas
    npc.display();
  }
  
  image(casa, 150, 420, 160, 150);
}

// Clase Path para definir la ruta
class Path {
  ArrayList<PVector> points = new ArrayList<>();
  float radius = 20;  // Radio del "carril" que los NPCs deben seguir
  
  // Agregar un punto a la ruta
  void addPoint(float x, float y) {
    points.add(new PVector(x, y));
  }
  
  // Dibujar la ruta
  void display() {
    stroke(255);
    noFill();
    strokeWeight(radius * 2);
    beginShape();
    for (PVector p : points) {
      vertex(p.x, p.y);
    }
    endShape();
    
    stroke(200);
    strokeWeight(2);
    beginShape();
    for (PVector p : points) {
      vertex(p.x, p.y);
    }
    endShape();
  }
  
  // Encontrar el punto más cercano en el camino
  PVector getClosestPoint(PVector position) {
    PVector closestPoint = null;
    float recordDist = Float.MAX_VALUE;
    
    for (int i = 0; i < points.size() - 1; i++) {
      PVector segmentStart = points.get(i);
      PVector segmentEnd = points.get(i + 1);
      PVector closest = getClosestPointOnSegment(position, segmentStart, segmentEnd);
      float d = PVector.dist(position, closest);
      if (d < recordDist) {
        recordDist = d;
        closestPoint = closest;
      }
    }
    
    return closestPoint;
  }
  
  // Encontrar el siguiente punto más adelante en el camino
  PVector getNextPoint(PVector position) {
    int closestIndex = -1;
    float recordDist = Float.MAX_VALUE;
    
    for (int i = 0; i < points.size() - 1; i++) {
      PVector segmentStart = points.get(i);
      float d = PVector.dist(position, segmentStart);
      if (d < recordDist) {
        recordDist = d;
        closestIndex = i;
      }
    }
    
    // Ver si podemos avanzar al siguiente punto
    if (closestIndex < points.size() - 1) {
      return points.get(closestIndex + 1);
    } else {
      return points.get(closestIndex);
    }
  }
}

// Clase NPC
class NPC {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxSpeed = 3;
  float maxForce = 0.1;
  float size = 8;
  int currentPointIndex = 0; // Controla a qué punto de la ruta se dirige
  
  NPC(float x, float y) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    acceleration = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  // Seguir la ruta
  void followPath(Path path) {
    // Obtener el siguiente punto en el camino
    PVector target = path.points.get(currentPointIndex);
    
    // Si estamos cerca del punto, cambiar al siguiente
    if (PVector.dist(position, target) < 10) {
      currentPointIndex++;
      if (currentPointIndex >= path.points.size()) {
        currentPointIndex = path.points.size() - 1;  // Mantenerse en el último punto
      }
    }
    
    // Dirigirse hacia el punto objetivo
    seek(target);
  }
  
  // Dirigirse hacia un objetivo (punto)
  void seek(PVector target) {
    PVector desired = PVector.sub(target, position);
    desired.setMag(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  // Actualizar la posición del NPC
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    acceleration.mult(0);  // Resetear la aceleración
  }
  
  // Evitar que los NPCs se salgan del canvas
  void edges() {
    if (position.x > width) position.x = 0;
    if (position.x < 0) position.x = width;
    if (position.y > height) position.y = 0;
    if (position.y < 0) position.y = height;
  }
  
  // Dibujar el NPC
  void display() {
    fill(200, 100, 100);
    stroke(255);
    ellipse(position.x, position.y, size, size);
  }
}

// Función para obtener el punto más cercano en un segmento de línea
PVector getClosestPointOnSegment(PVector p, PVector a, PVector b) {
  PVector ap = PVector.sub(p, a);
  PVector ab = PVector.sub(b, a);
  ab.normalize();
  ab.mult(ap.dot(ab));
  PVector closest = PVector.add(a, ab);
  return closest;
}
