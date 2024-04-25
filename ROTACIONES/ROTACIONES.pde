PImage sol;
PImage nave;
float angle = 0;

void setup() {
  size(400, 400);
  sol = loadImage("sol1.png");
  nave = loadImage("nave.png");
  imageMode(CENTER);
}

void draw() {
  background(0);
  image(nave, 80, 80, 50, 50); // Dibujar la nave
  pushMatrix(); // Guardar la matriz de transformación actual
  translate(200, 200); // Trasladar al centro del canvas
  rotate(radians(angle)); // Rotar por el ángulo en radianes
  image(sol, 0, 0, 100, 100); // Dibujar el sol
  image(nave, 80, 80, 50, 50); // Dibujar la nave
  popMatrix(); // Restaurar la matriz de transformación anterior
  
  angle += 1; // Incrementar el ángulo de rotación
}
                                                               
                                                               
