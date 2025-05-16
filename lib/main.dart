import 'package:flutter/material.dart';  
import 'package:google_fonts/google_fonts.dart';  
import 'screen/avion_home_page.dart';  // <- Nota: 'screen' en minúsculas.  

void main() {  
  runApp(const MyApp());  
}  

class MyApp extends StatelessWidget {  
  const MyApp({super.key});  

  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      debugShowCheckedModeBanner: false,  
      theme: ThemeData(  
        textTheme: GoogleFonts.muktaMaheeTextTheme(),  
      ),  
      home: const AvionHomePage(),  // <- Cambiado a AvionHomePage  
    );  
  }  
}  