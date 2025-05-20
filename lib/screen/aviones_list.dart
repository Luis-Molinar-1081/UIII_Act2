import 'package:flutter/material.dart';
import 'package:myapp/models/Avion_mode.dart';
import 'package:myapp/constants.dart';

class AvionesList extends StatelessWidget {
  final Size size;
  
  const AvionesList({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Título de la sección
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Flota Disponible",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Icon(Icons.airplanemode_active, color: Colors.white, size: 30),
            ],
          ),
        ),
        
        // Lista horizontal de aviones CENTRADA
        SizedBox(
          height: 250,
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: listAvion.length,
              itemBuilder: (context, index) {
                final avion = listAvion[index];
                return Container(
                  width: size.width * 0.6,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Imagen del avión
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        child: Image.asset(
                          'assets/images/Avion3.jpg',
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      
                      // Detalles del avión
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              avion.modelo,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "\$${avion.precioPorAsiento} por asiento",
                              style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}