import 'package:flutter/material.dart';
import 'package:myapp/screen/specification_detail.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/models/Avion_mode.dart';
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

  void _toggleDetails() {
    setState(() {
      isShow = !isShow;
      mainHeight = isShow ? 773 : 213;
      height = isShow ? 90 : 650;
    });
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
              // Encabezado superior
              Container(
                height: 90,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                color: primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, color: Colors.black, size: 30),
                    const Text(
                      "Aviones Disponibles",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: Icon(Icons.person, color: Colors.black87, size: 22),
                    ),
                  ],
                ),
              ),

              AnimatedContainer(
                height: mainHeight,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isShow) Center(child: AvionesList(size: size)),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              "Boeing 737",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 36,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "\$250,000",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                                color: Colors.blueAccent[700],
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Avión comercial de pasillo único con capacidad para 150-200 pasajeros...",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 25),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SpecificationDetail(
                onToggleDetails: _toggleDetails,
                isShow: isShow,
                size: size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}