import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/transferencia.dart';

import 'formulario_transferencia.dart';

class ListaTransferencia extends StatefulWidget {

  final List<Transferencia> _transferencias = [];
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }

}
class ListaTransferenciasState extends State<ListaTransferencia>{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder (
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      appBar : AppBar(title: Text('Transferencias'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future = Navigator.push(context, MaterialPageRoute(builder: (context)
          {
            return FormularioTransferencia();
          }));

          future.then((transferenciaRecebida){

            if(transferenciaRecebida != null){
              debugPrint('passou por aqui depois');
              setState((){
                widget._transferencias.add(transferenciaRecebida);
              });

            }
          });
        },
        child: Icon(Icons.add),
      ),

    );
  }
}

class ItemTransferencia extends StatelessWidget{

  final Transferencia _tranferencia;

  ItemTransferencia(this._tranferencia);

  @override
  Widget build(BuildContext context) {

    return  Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_tranferencia.valor.toString()),
          subtitle: Text(_tranferencia.conta.toString()),
        )
    );
  }

}
