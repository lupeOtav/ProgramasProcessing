import java.util.ArrayList;

ArrayList<Elemento> elementos; 
PImage img; 
PImage img1;
PImage img2;
PImage img3;
Button botonAgregar, botonEliminar; 
int i=0;

void setup() {
  size(840, 600);
  img = loadImage("H4.png"); 
  img1 = loadImage("H11.png"); 
  img2 = loadImage("H2.png"); 
  img3 = loadImage("H31.png"); 
  elementos = new ArrayList<Elemento>(); // Inicializa el ArrayList
  crearBotones();
}

void draw() {
  background(255);
  int posx = -80;
  int posy = 0;
  // Dibuja todos los elementos en la lista
  for (int i = 0; i < elementos.size(); i++) {
    Elemento e = elementos.get(i);
     if ((i % 5) == 0) {//si i es multiplo de 5 (i es multiplo si al dividirlo por 5 me da un numero entero)
      posy = 0;
      posx = posx + 80;
    }
    e.mostrar(posx, 60 + posy); // Muestra el elemento en la posición adecuada
    posy = posy + 80;
  }

  botonAgregar.display();
  botonEliminar.display();
}

void crearBotones() {
  botonAgregar = new Button("Agregar", 20, 20, 80, 30);
  botonEliminar = new Button("Eliminar", 120, 20, 80, 30);
}

void agregarElemento() {
  PImage imagen=img;
  int opcion=int(random(4));
  if (opcion==0) imagen=img;
  if (opcion==1) imagen=img1;
  if (opcion==2) imagen=img2;
  if (opcion==3) imagen=img3;
  elementos.add(new Elemento("Nuevo elemento " + i, imagen));
  i++;
  println(i);
}

void eliminarElemento() {
  if (!elementos.isEmpty()) {
    elementos.remove(elementos.size() - 1);
    i--;
    println(i);
  }
}

void mousePressed() {
  for (Elemento e : elementos) {
    if (e.hover()) {
      println("Clic en el elemento: " + e.texto);
    }
  }
  if ( botonAgregar.clickeado()) {
    agregarElemento();
  }
  if (botonEliminar.clickeado()) {
    eliminarElemento();
  }
}
