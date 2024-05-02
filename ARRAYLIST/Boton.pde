class Button {
  String label;
  float x, y, w, h;
 

  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

   boolean clickeado() {
    if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
      return true;
    } else {
      return false;
    }
  }

  // Verifica si el mouse está sobre el botón
  boolean hover() {
    return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
  }

  // Dibuja el botón
  void display() {
    fill(hover() ? color(200) : color(220));
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    text(label, x + w / 2, y + h / 2);
  }
}
