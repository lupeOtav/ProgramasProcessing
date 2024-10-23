import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import ddf.minim.*;

Minim minim;
AudioOutput out;
Oscil oscilador;

int[] tetris = {
  1760, 1319, 1397, 1175, 1175, 1397, 1760, 1568, 1397, 1319, 1319, 1397, 1568, 1760,
  1397, 1175, 1175, 1568, 1865, 
  2349, 2349, 1047, 1865, 1760, 1397, 1760, 1760, 1568, 1397, 1319, 1319, 1397,
  1568, 1760, 1175,
  1760, 1319, 1397, 1175, 1175, 1397, 1760, 1568, 1397, 1319, 1319, 1397, 1568, 1760,
  1397, 1175, 1175, 1568, 1865,
  2349, 2349, 1047, 1865, 1760, 1397, 1760, 1760, 1568, 1397, 1319, 1319, 1397,
  1568, 1760, 1175,
  1397, 1175, 1109, 1319, 1760, 1397, 1568, 1319, 1397, 1760
};

int[] tiempos = {
  4,8,8,4,8,8,4,8,8,4,
  8,8,4,4,4,4,2,4,4,8,
  8,8,8,4,8,8,8,8,8,4,
  8,8,4,4,2,4,8,8,4,8,
  8,4,8,8,4,8,8,4,4,4,
  4,2,4,4,8,8,8,8,4,8,
  8,8,8,8,4,8,8,4,4,2,
  2,2,2,2,2,2,2,2,2,1
};

int indiceNota = 0;
int tiempoInicio = 0;

void setup() {
  size(200, 200);
  
  // Inicializar Minim y oscilador
  minim = new Minim(this);
  out = minim.getLineOut();
  oscilador = new Oscil(440, 0.5, Waves.SINE);
  
  reproducirNota();
}

void draw() {
  int duracion = 1500 / tiempos[indiceNota];
  
  if (millis() - tiempoInicio >= duracion) {
    oscilador.unpatch(out);  // Silencia la nota
    //int silencio = (int)(duracion * 1.30);
   // delay(silencio);  // Espera el tiempo del silencio
    siguienteNota();
    reproducirNota();
  }
}

void reproducirNota() {
  oscilador.setFrequency(tetris[indiceNota]);  // Ajusta la frecuencia de la nota actual
  oscilador.patch(out);  // Reproduce la nota
  tiempoInicio = millis();
}

void siguienteNota() {
  indiceNota = (indiceNota + 1) % tetris.length;  // Avanza a la siguiente nota
}
