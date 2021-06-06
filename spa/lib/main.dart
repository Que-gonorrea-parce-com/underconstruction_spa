import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'package:google_fonts/google_fonts.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Que gonorrea parce!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _getInTouch() async  {

    final mailtoLink = Mailto(
      to: ['yprojects.med@gmail.com'],
      subject: 'quegonorreaparce.com',
      body: 'Me gustaria estar informado de actualizaciones '
    );
    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                  "Que gonorrea parce!",
                style: GoogleFonts.josefinSans(
                  fontSize: 40,
                  fontWeight: FontWeight.w800
                )
              ),
              padding: EdgeInsets.only(left: 30, bottom: 30, right: 30),
            ),
            _HeaderImage(),
            _Description(),
            Positioned(
                child: Container(
                  child: Text(
                      "yprojects.med@gmail.com \n Juan Gonzalo Quiroz Cadavid \n (+57) 301 347 59 95",
                      style: GoogleFonts.josefinSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w800
                      ),
                    textAlign: TextAlign.center,

                  ),
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getInTouch,
        tooltip: 'Quiero estar informado',
        child: Icon(Icons.email_outlined),
      ),
    );
  }
}


class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Text(
        'El mercado está lleno de muchos lugares, productos, experiencias que lo máximo que merecen es un 0! Hagamos una comunidad donde podamos quejarnos de todo lo que no nos guste para poder desquitarnos y también informar a los demás para que entiendan que les espera.',
        style: GoogleFonts.josefinSans(
            fontSize: 20,
            fontWeight: FontWeight.normal
        ),
        textAlign: TextAlign.justify,
      ),
      width: 1000,
    );
  }
}

class _HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              child: Image.asset('assets/img/definition.png')
          ),
          InkWell(
            child: Text(
              "urbandictionary.com",
              style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.normal
              ),
            ),
            onTap: () {
              js.context.callMethod('open', ['https://www.urbandictionary.com/define.php?term=gonorrea']);
            },
          )
        ],
      ),
    );
  }
}

