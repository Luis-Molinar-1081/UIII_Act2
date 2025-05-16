import 'package:flutter/material.dart';
import 'package:myapp/screen/specification_detail.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/models/Avion_mode.dart'; // Asegúrate que este es tu modelo de avión
import 'package:myapp/screen/aviones_list.dart';
class AvionHomePage extends StatefulWidget {
  const AvionHomePage({super.key});

  @override
  _AvionHomePageState createState() => _AvionHomePageState();
}

class _AvionHomePageState extends State<AvionHomePage> {
  late bool isShow;
  double mainHeight = 773;
  double height = 90;

  @override
  void initState() {
    isShow = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor,
              secondaryColor,
              secondaryColor,
              secondaryColor,
              secondaryColor,
              secondaryColor,
              secondaryColor,
              secondaryColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 70, color: primaryColor),
              AnimatedContainer(
                height: mainHeight,
                duration: const Duration(microseconds: 300),
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (isShow)
                        // Reemplazar AdultScooters con componente de aviones
                        AvionesList(size: size),
                      
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Boeing 737", // Cambiado a modelo de avión
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 40,
                              ),
                            ),
                            Text(
                              "\$250,000", // Precio ajustado
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 25,
                                color: secondaryColor),
                            ),
                            const Text(
                              "Avión comercial de pasillo único con capacidad para 150-200 pasajeros...",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(microseconds: 1),
                height: height,
                child: Column(
                  children: [
                    if (isShow)
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Mostrar Detalles",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 22,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isShow = false;
                                  mainHeight = 213;
                                  height = 650;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: cardColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    if (!isShow)
                      Container(
                        color: secondaryColor,
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 40, bottom: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Características Principales",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (Avion avion in listAvion) // Cambiado a listAvion
                                      SizedBox(
                                        height: size.height * 0.23,
                                        width: size.width * 0.39,
                                        child: Card(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          color: cardColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                avion.imageUrl, // Imagen de avión
                                                height: size.height * 0.2,
                                                width: size.width * 0.35,
                                                fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                child: Container(
                                                  height: 45,
                                                  width: size.width * 0.39,
                                                  decoration: BoxDecoration(
                                                    color: secondaryColor
                                                        .withOpacity(0.4),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      avion.modelo, // Nombre del modelo
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Especificaciones Técnicas",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const SpecificationDetail(), // Asegurar que este componente también esté adaptado
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 30, top: 20, bottom: 20),
                                child: Container(
                                  height: 65,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.amber[700],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Reservar Ahora", // Cambiado de "Buy Now"
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: const Icon(Icons.arrow_forward)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}