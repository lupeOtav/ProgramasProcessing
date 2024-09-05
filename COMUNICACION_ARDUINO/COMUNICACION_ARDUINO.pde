import processing.serial.*;

Serial puerto; 
int dato;  
int numero;

void setup() {
  //println(Serial.list()); // Muestra la lista de puertos disponibles
  String nombrePuerto = Serial.list()[0]; // Selecciona el primer puerto de la lista
  puerto = new Serial(this, nombrePuerto, 9600); // Inicia la comunicación serial a 9600 baudios
}

void draw() {
    String dato = puerto.readStringUntil('\n'); // Lee los datos hasta el carácter de nueva línea
    if (dato != null) {
      dato = trim(dato); // Elimina espacios en blanco
      numero = int(dato); // Convierte el dato a un número entero
      println("Número recibido: " + numero); // Muestra el número en la consola
    }
}
