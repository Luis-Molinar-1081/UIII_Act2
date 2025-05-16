class Avion {
  final String id;
  final String modelo;
  final String imageUrl;
  final double precioPorAsiento;

  Avion({
    required this.id,
    required this.modelo,
    required this.imageUrl,
    required this.precioPorAsiento,
  });
}

final List<Avion> listAvion = [
  Avion(
    id: '1',
    modelo: 'Boeing 737',
    imageUrl: 'assets/aviones/boeing737.png',
    precioPorAsiento: 250.00,
  ),
];