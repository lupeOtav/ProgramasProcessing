import processing.data.*;

JSONArray ciudades;
int indiceCiudad = 0;
Button botonSiguiente;
Button botonGuardar;
TextBox txtPais;
TextBox txtRegion;
TextBox txtClima;
TextBox txtImagen;
TextBox txtFlora;
TextBox txtFauna;

void setup() {
  size(800, 400);
  botonSiguiente = new Button(150, 350, 100, 40, "Siguiente");
  botonGuardar = new Button(460, 350, 100, 40, "Guardar");
  String[] lineas = loadStrings("ciudades.json");
  String json = join(lineas, "");
  JSONObject data = parseJSONObject(json);
  ciudades = data.getJSONArray("ciudades");

  mostrarCiudad(ciudades.getJSONObject(indiceCiudad));
  crearTextBoxs();
}

void agregarCiudad() {
  // Solicitar al usuario que ingrese los datos de la nueva ciudad
  String nombre = txtPais.getTexto();
  String faunaInput = txtFauna.getTexto();
  String floraInput = txtFlora.getTexto();
  String clima = txtClima.getTexto();
  String region = txtRegion.getTexto();
  String imagen = txtImagen.getTexto();

  // Crear un nuevo objeto JSONObject para representar la nueva ciudad
  JSONObject nuevaCiudad = new JSONObject();
  nuevaCiudad.setString("nombre", nombre);

  // Convertir las cadenas de fauna y flora en arrays JSON
  JSONArray faunaArray = new JSONArray();
  faunaArray.append(faunaInput);
  nuevaCiudad.setJSONArray("fauna", faunaArray);

  JSONArray floraArray = new JSONArray();
  floraArray.append(floraInput);
  nuevaCiudad.setJSONArray("flora", floraArray);

  nuevaCiudad.setString("clima", clima);
  nuevaCiudad.setString("region", region);
  nuevaCiudad.setString("imagen", imagen);

  // Agregar la nueva ciudad al array de ciudades
  ciudades.append(nuevaCiudad);

  // Guardar los cambios en el archivo
  guardarDatos();
}

void guardarDatos() {
  JSONObject data = new JSONObject();
  data.setJSONArray("ciudades", ciudades);
  saveJSONObject(data, "ciudades.json");
}

void draw() {
  background(200);
  mostrarCiudad(ciudades.getJSONObject(indiceCiudad));
  botonSiguiente.mostrar();
  botonGuardar.mostrar();
  dibujarTextBoxs();
  line(380, 100, 380, 300);
}

void mousePressed() {
  if (botonSiguiente.mouseHover()) {
    indiceCiudad++;
    if (indiceCiudad >= ciudades.size()) {
      indiceCiudad = 0;
    }
  }
  if (botonGuardar.mouseHover()) {
    //TODO: aca tendria que validar que el usuario no cargo cualquier cosa y manejar posibles errores
    agregarCiudad();
  }
  manejarMouseEnTextBox();
}

void mostrarTextoCentrado(String texto, int canvasWidth, int yPos) {

  float x = (canvasWidth - textWidth(texto)) / 2;
  text(texto, x, yPos + 60);
}

void mostrarCiudad(JSONObject ciudad) {
  textSize(28);
  fill(255);
  mostrarTextoCentrado("Consultar registros", 400, -20);
  fill(0);
  textSize(24);
  String nombre = ciudad.getString("nombre");
  mostrarTextoCentrado("Nombre: " + nombre, 400, 20);
  JSONArray faunaCiudad = ciudad.getJSONArray("fauna");
  mostrarTextoCentrado("Fauna: " + arrayToString(faunaCiudad), 400, 40);
  JSONArray floraCiudad = ciudad.getJSONArray("flora");
  mostrarTextoCentrado("Flora: " + arrayToString(floraCiudad), 400, 60);
  mostrarTextoCentrado("Clima: " + ciudad.getString("clima"), 400, 80);
  mostrarTextoCentrado("Región: " + ciudad.getString("region"), 400, 100);
  mostrarTextoCentrado("Imagen: " + ciudad.getString("imagen"), 400, 120);
}

String arrayToString(JSONArray array) {
  String result = "";
  for (int i = 0; i < array.size(); i++) {
    result += array.getString(i);
    if (i < array.size() - 1) {
      result += ", ";
    }
  }
  return result;
}

void crearTextBoxs() {
  // Crear los TextBox para el formulario
  txtPais = new TextBox(500, 30, 200, 20);
  txtRegion = new TextBox(500, 70, 200, 20);
  txtClima = new TextBox(500, 110, 200, 20);
  txtFlora = new TextBox(500, 150, 200, 20);
  txtFauna = new TextBox(500, 190, 200, 20);
  txtImagen = new TextBox(500, 230, 200, 20);
  // Establecer texto inicial en las etiquetas
  txtPais.texto = "Ingresa el país";
  txtRegion.texto = "Ingresa la región";
  txtClima.texto = "Ingresa el clima";
  txtFlora.texto = "Ingresa la flora";
  txtFauna.texto = "Ingresa la fauna";
  txtImagen.texto = "Ingresa la imagen";
}

void dibujarTextBoxs() {
  // Mostrar las etiquetas y los TextBox en el formulario
  fill(0);
  textSize(24);
  textAlign(RIGHT);
  text("País:", 480, 45);
  text("Región:", 480, 85);
  text("Clima:", 480, 125);
  text("Flora:", 480, 165);
  text("Fauna:", 480, 205);
  text("Imagen:", 480, 245);
   
  fill(255);
  textSize(28);
   text("Completá todos los campos", 720, 290);
   
   textSize(24);
  txtPais.mostrar();
  txtRegion.mostrar();
  txtClima.mostrar();
  txtImagen.mostrar();
  txtFlora.mostrar();
  txtFauna.mostrar();
}

void manejarMouseEnTextBox() {
  // Manejar el enfoque de los TextBox al hacer clic en ellos
  if (txtPais.estaEnfocado()) {
    txtPais.enfocar(true);
    txtRegion.enfocar(false);
    txtClima.enfocar(false);
    txtImagen.enfocar(false);
    txtFlora.enfocar(false);
    txtFauna.enfocar(false);
  } else if (txtRegion.estaEnfocado()) {
    txtPais.enfocar(false);
    txtRegion.enfocar(true);
    txtClima.enfocar(false);
    txtImagen.enfocar(false);
    txtFlora.enfocar(false);
    txtFauna.enfocar(false);
  } else if (txtClima.estaEnfocado()) {
    txtPais.enfocar(false);
    txtRegion.enfocar(false);
    txtClima.enfocar(true);
    txtImagen.enfocar(false);
    txtFlora.enfocar(false);
    txtFauna.enfocar(false);
  } else if (txtImagen.estaEnfocado()) {
    txtPais.enfocar(false);
    txtRegion.enfocar(false);
    txtClima.enfocar(false);
    txtImagen.enfocar(true);
    txtFlora.enfocar(false);
    txtFauna.enfocar(false);
  } else if (txtFlora.estaEnfocado()) {
    txtPais.enfocar(false);
    txtRegion.enfocar(false);
    txtClima.enfocar(false);
    txtImagen.enfocar(false);
    txtFlora.enfocar(true);
    txtFauna.enfocar(false);
  } else if (txtFauna.estaEnfocado()) {
    txtPais.enfocar(false);
    txtRegion.enfocar(false);
    txtClima.enfocar(false);
    txtImagen.enfocar(false);
    txtFlora.enfocar(false);
    txtFauna.enfocar(true);
  } else {
    txtPais.enfocar(false);
    txtRegion.enfocar(false);
    txtClima.enfocar(false);
    txtImagen.enfocar(false);
    txtFlora.enfocar(false);
    txtFauna.enfocar(false);
  }
}

void keyPressed() {
  // Permitir al usuario ingresar texto en los TextBox
  txtPais.manejarEntradaTeclado();
  txtRegion.manejarEntradaTeclado();
  txtClima.manejarEntradaTeclado();
  txtFlora.manejarEntradaTeclado();
  txtFauna.manejarEntradaTeclado();
  txtImagen.manejarEntradaTeclado();
}
