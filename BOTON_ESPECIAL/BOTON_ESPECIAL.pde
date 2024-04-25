import gifAnimation.*;

Boton miBoton;
Gif anim;

void setup() {
  size(350, 370);
  miBoton = new Boton(100, 200, 150, 50, "Start");
  // Cargar la animación GIF
  anim = new Gif(this, "hongo.gif");
  anim.play(); // Iniciar la animación
}

void draw() {
  background(220);
  
  boolean hover = miBoton.mostrar();
  if(hover){
     image(anim, 100,50, 150,150);  
    }
}

void mousePressed() {
  if (miBoton.clickeado()) {

    println("¡Se ha clickeado en el botón!");
  }
}
