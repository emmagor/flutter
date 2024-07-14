// Ejercicio 1
void ejercicio1() {
  print("Hola Mundo");
}

// Ejercicio 2
int sumar(int a, int b) {
  return a + b;
}

// Ejemplo de uso para Ejercicio 2
void ejemploEjercicio2() {
  print(sumar(3, 4)); // Devuelve 7
}

// Ejercicio 3
class Persona {
  String nombre;
  int edad;

  Persona(this.nombre, this.edad);

  void descripcion() {
    print("Nombre: $nombre, Edad: $edad");
  }
}

// Ejemplo de uso para Ejercicio 3
void ejemploEjercicio3() {
  Persona persona = Persona("Juan", 30);
  persona.descripcion(); // Imprime "Nombre: Juan, Edad: 30"
}

// Ejercicio 4
int sumarLista(List<int> lista) {
  return lista.reduce((a, b) => a + b);
}

// Ejemplo de uso para Ejercicio 4
void ejemploEjercicio4() {
  print(sumarLista([1, 2, 3, 4, 5])); // Devuelve 15
}

// Ejercicio 5
bool esPar(int numero) {
  return numero % 2 == 0;
}

// Ejemplo de uso para Ejercicio 5
void ejemploEjercicio5() {
  print(esPar(4)); // Devuelve true
  print(esPar(5)); // Devuelve false
}

// Ejercicio 6
int factorial(int n) {
  if (n == 0) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

// Ejemplo de uso para Ejercicio 6
void ejemploEjercicio6() {
  print(factorial(5)); // Devuelve 120
}

// Ejercicio 7
double celsiusAFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

// Ejemplo de uso para Ejercicio 7
void ejemploEjercicio7() {
  print(celsiusAFahrenheit(25)); // Devuelve 77.0
}

// Ejercicio 8
String invertirCadena(String cadena) {
  return cadena.split('').reversed.join('');
}

// Ejemplo de uso para Ejercicio 8
void ejemploEjercicio8() {
  print(invertirCadena("Hola Mundo")); // Devuelve "odnuM aloH"
}

// Ejercicio 9
void ejemploEjercicio9() {
  List<Persona> personas = [Persona("Juan", 30), Persona("Ana", 25), Persona("Luis", 35)];
  personas.sort((a, b) => a.edad.compareTo(b.edad));
  print(personas); // Devuelve [Ana (25), Juan (30), Luis (35)]
}

// Ejercicio 10
List<String> aMayusculas(List<String> listaCadenas) {
  return listaCadenas.map((cadena) => cadena.toUpperCase()).toList();
}

// Ejemplo de uso para Ejercicio 10
void ejemploEjercicio10() {
  print(aMayusculas(["hola", "mundo"])); // Devuelve ['HOLA', 'MUNDO']
}

void main() {
  // Llamadas a los ejercicios y ejemplos
  ejercicio1();
  ejemploEjercicio2();
  ejemploEjercicio3();
  ejemploEjercicio4();
  ejemploEjercicio5();
  ejemploEjercicio6();
  ejemploEjercicio7();
  ejemploEjercicio8();
  ejemploEjercicio9();
  ejemploEjercicio10();
}

