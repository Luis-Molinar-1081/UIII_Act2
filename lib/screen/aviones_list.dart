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
              Icon(Icons.airplanemode_active, color: Colors.white, size: 30),
            ],
          ),
        ),
        
        // Lista horizontal de aviones
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listAvion.length,
            itemBuilder: (context, index) {
              final avion = listAvion[index];
              return Container(
                width: size.width * 0.6,
                margin: EdgeInsets.only(
                  left: index == 0 ? 25 : 15,
                  right: index == listAvion.length - 1 ? 25 : 0,
                ),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen del avión
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.asset(
                        avion.imageUrl,
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
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
      ],
    );
  }
}