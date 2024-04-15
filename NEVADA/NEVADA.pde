PImage unCopo;
CopoDeNieve[] copos =new CopoDeNieve[100];
PImage fondo;

void setup() {
  size(470, 680);
  
  unCopo = loadImage("copo2.png");
  fondo = loadImage("FONDO.jpg");
  
  // Crear varios copos de nieve al inicio
  for (int i = 0; i < 100; i++) {
    float x = random(width);
    float y = random(-height, 0);
    float velocidadY = random(1, 3);
    float velocidadRotacion = random(-0.01, 0.01);
    float tamano = random(10, 30);
    CopoDeNieve copo = new CopoDeNieve(x, y, velocidadY, velocidadRotacion, tamano);
    copos[i]=copo;
  }
}

void draw() {
  //background(0);
  image(fondo, 0,0,470,680);
  for (int i=0; i<copos.length; i++ ) {
    copos[i].actualizar();
    copos[i].mostrar();
  }
}

class CopoDeNieve {
      float x;
    float y;
   float velocidadY;
    float velocidadRotacion;
    float tamano;
    float rotacion;
  CopoDeNieve(float x,float y, float velocidadY, float velocidadRotacion, float tamano) {
    this.x = x;
    this.y = y;
    this.velocidadY = velocidadY;
    this.velocidadRotacion = velocidadRotacion;
    this.tamano = tamano;
    this.rotacion = 0;
  }
  
  void actualizar() {
    this.y += this.velocidadY;
    this.rotacion += this.velocidadRotacion;
    
    // Reiniciar la posición del copo si sale de la pantalla
    if (this.y > height) {
      this.y = random(-height, 0);
    }
  }
  
 void mostrar() {
    push();
    translate(this.x, this.y);
    rotate(this.rotacion);
    image(unCopo, 0, 0, this.tamano, this.tamano);
    pop();
  }
}
