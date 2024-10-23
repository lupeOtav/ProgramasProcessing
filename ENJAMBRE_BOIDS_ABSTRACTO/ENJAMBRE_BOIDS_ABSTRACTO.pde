ArrayList<NPC> npcs = new ArrayList<>();
int numNPCs = 100;

void setup() {
  size(800, 800);
  
  // Crear NPCs
  for (int i = 0; i < numNPCs; i++) {
    npcs.add(new NPC(random(width), random(height), random(4, 16)));  // Tamaño aleatorio entre 4 y 16
  }
}

void draw() {
  //background(51, 50);
    blendMode(BLEND);
  
  // Dibujar un fondo blanco semitransparente
  fill(51, 50); // Color blanco con transparencia
  rect(0, 0, width, height); // Dibujar un rectángulo del tamaño de la ventana
  
  
  // Actualizar y dibujar NPCs
  for (NPC npc : npcs) {
    npc.flock(npcs);  // Aplicar comportamiento de flocking
    npc.update();
    npc.edges();  // Mantener a los NPCs dentro del canvas
    npc.display();
  }
}

// Clase NPC (o boid)
class NPC {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxSpeed = 4;  // Velocidad máxima
  float maxForce = 0.1;  // Fuerza máxima de aceleración
  float size;  // Tamaño del NPC pasado como parámetro

  NPC(float x, float y, float size) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    acceleration = new PVector(0, 0);
    this.size = size;  // Tamaño del NPC pasado como parámetro
  }

  void applyForce(PVector force) {
    acceleration.add(force);  // Aplicar una fuerza a la aceleración
  }

  void flock(ArrayList<NPC> npcs) {
    PVector separation = separate(npcs);  // Evitar colisiones
    PVector alignment = align(npcs);  // Alinear dirección con el grupo
    PVector cohesion = cohesion(npcs);  // Moverse hacia el centro del grupo
    
    // Ajustar el peso de cada comportamiento
    separation.mult(1.5);  // Separación más fuerte
    alignment.mult(1.0);
    cohesion.mult(1.0);
    
    // Aplicar las fuerzas resultantes
    applyForce(separation);
    applyForce(alignment);
    applyForce(cohesion);
  }

  PVector separate(ArrayList<NPC> npcs) {
    float desiredSeparation = size * 2;  // Separación basada en el tamaño del NPC
    PVector steer = new PVector(0, 0);
    int count = 0;
    
    for (NPC other : npcs) {
      float d = PVector.dist(position, other.position);
      if (d > 0 && d < desiredSeparation) {
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }
    
    if (count > 0) {
      steer.div(count);
    }
    
    if (steer.mag() > 0) {
      steer.setMag(maxSpeed);
      steer.sub(velocity);
      steer.limit(maxForce);
    }
    
    return steer;
  }

  PVector align(ArrayList<NPC> npcs) {
    float neighborDist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    
    for (NPC other : npcs) {
      float d = PVector.dist(position, other.position);
      if (d > 0 && d < neighborDist) {
        sum.add(other.velocity);
        count++;
      }
    }
    
    if (count > 0) {
      sum.div(count);
      sum.setMag(maxSpeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  PVector cohesion(ArrayList<NPC> npcs) {
    float neighborDist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    
    for (NPC other : npcs) {
      float d = PVector.dist(position, other.position);
      if (d > 0 && d < neighborDist) {
        sum.add(other.position);
        count++;
      }
    }
    
    if (count > 0) {
      sum.div(count);
      return seek(sum);
    } else {
      return new PVector(0, 0);
    }
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);
    desired.setMag(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    return steer;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    acceleration.mult(0);
  }

  void edges() {
    if (position.x > width) position.x = 0;
    if (position.x < 0) position.x = width;
    if (position.y > height) position.y = 0;
    if (position.y < 0) position.y = height;
  }

  void display() {
    fill(200, 100, 100);
    stroke(255);
    ellipse(position.x, position.y, size, size);
  }
}
