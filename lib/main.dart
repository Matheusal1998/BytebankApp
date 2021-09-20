import 'package:flutter/material.dart';
import 'package:my_app/screen/transferencias/lista_transferencia.dart';

void main() => runApp(BytebankApp());
class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ListaTransferencia(),
    );
  }
}



