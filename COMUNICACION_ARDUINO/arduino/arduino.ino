
void setup() {
  Serial.begin(9600); // Inicia la comunicación serial a 9600 baudios
}

void loop() {
 // if (Serial.available() > 0) { // Verifica si hay datos disponibles
    int dato =random(0,100);
 
    Serial.println(dato); // Envía el dato de vuelta al monitor serial
    delay(1000);
  //}
}
