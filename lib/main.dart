import 'package:flutter/material.dart';
import 'package:melendez/route_generator.dart';

void main() => runApp(MelendezApp());

class MelendezApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meléndez',
      initialRoute: "/",
      // home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    ); //Fin de MaterialApp
  } //Fin de widget
} //Fin de clase MelendezApp

class PageOne extends StatelessWidget {
  String _params = "hola desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PageOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pagina 1 de Meléndez'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Siguiente página",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.deepPurple[200],
            onPressed: () {
              _openSecondPage(context);
            },
          ), //Fin de boton hijo
        ), //Fin de contenedor
      ), //Fin de body center
    ); //Fin de Scaffold
  } //Fin de widget

  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );

    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  } //Fin de void _openSecondPage
} //Fin de clase PageOne
