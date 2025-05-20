import 'package:flutter/material.dart';

class SpecificationDetail extends StatefulWidget {
  final Function() onToggleDetails;
  final bool isShow;
  final Size size;

  const SpecificationDetail({
    super.key,
    required this.onToggleDetails,
    required this.isShow,
    required this.size,
  });

  @override
  State<SpecificationDetail> createState() => _SpecificationDetailState();
}

class _SpecificationDetailState extends State<SpecificationDetail> {
  // Lista de imágenes y títulos para las tarjetas
  final List<Map<String, String>> cardItems = [
    {
      'image': 'assets/images/Whel.jpg',
      'title': 'Ruedas',
    },
    {
      'image': 'assets/images/Motor.PNG',
      'title': 'Motor',
    },
    {
      'image': 'assets/images/Asientos.jpg',
      'title': 'Asientos',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.isShow)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                  onTap: widget.onToggleDetails,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: const Icon(Icons.arrow_downward, color: Colors.black87),
                  ),
                )
              ],
            ),
          ),
        
        if (!widget.isShow) ...[
          Container(
            color: const Color(0xff4E4AFF),
            child: Container(
              margin: const EdgeInsets.only(top: 40, bottom: 20, left: 20),
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
                            color: Color.fromARGB(221, 255, 255, 255),
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
                        for (final item in cardItems)
                          SizedBox(
                            height: widget.size.height * 0.23,
                            width: widget.size.width * 0.39,
                            child: Card(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              color: Colors.grey[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 4,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      item['image']!,
                                      height: widget.size.height * 0.2,
                                      width: widget.size.width * 0.39,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      height: 45,
                                      width: widget.size.width * 0.39,
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          item['title']!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
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
                        color: Color.fromARGB(221, 255, 255, 255),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSpecificationDetails(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30, top: 20, bottom: 20),
                    child: Container(
                      height: 65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 115, 0),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Reservar Ahora",
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
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Color.fromARGB(255, 255, 115, 0),
                              ),
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
      ],
    );
  }

  Widget _buildSpecificationDetails() {
    return const Padding(
      padding: EdgeInsets.only(right: 10, left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Wheel",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color.fromARGB(221, 255, 255, 255),
                ),
              ),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: Color.fromARGB(31, 255, 255, 255),
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
              Text(
                "200 mm",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color.fromARGB(221, 255, 255, 255),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Weight",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color.fromARGB(221, 255, 255, 255),
                ),
              ),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  value: 0.3,
                  backgroundColor: Color.fromARGB(31, 255, 255, 255),
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text(
                  "5.6 kg",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color.fromARGB(221, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Speed",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color.fromARGB(221, 255, 255, 255),
                ),
              ),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  value: 0.9,
                  backgroundColor: Color.fromARGB(31, 255, 255, 255),
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "9.5/10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color.fromRGBO(255, 255, 255, 0.867),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}