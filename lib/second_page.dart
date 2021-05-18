import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String texto;
  TextEditingController _textController = TextEditingController();

  SecondPage({Key key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla 2 de Meléndez"),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                controller: _textController,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "Ingrese palabra",
                  hintText: "Palabra",
                ),
              ),
            ),
            MaterialButton(
              child: Text("Regresar"),
              onPressed: () {
                Navigator.of(context).pop(_textController.text);
              },
            ),
          ], //Fin de widget[]
        ), //Fin de columna
      ), //Fin de body center
    ); //Fin de Scaffold
  } //Fin del widget
} //Fin de clase SecondPage
