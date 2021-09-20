import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/editor.dart';
import 'package:my_app/models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}
class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando transferência'),),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(controlador: _controladorCampoNumeroConta, rotulo: 'Número da conta',dica: '000', ),
              Editor(controlador: _controladorCampoValor, rotulo: 'Valor',dica: '00.00', icone: Icons.monetization_on,),
              RaisedButton(onPressed: () => _criaTransferencia(context),child: Text('Confirmar'),)
            ],
          )
      ),

    );
  }

  void _criaTransferencia(BuildContext context) {

    var numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    var valor = double.tryParse(_controladorCampoValor.text);

    if(numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor,numeroConta);
      debugPrint('$transferenciaCriada');

      Navigator.pop(context, transferenciaCriada);
    }


  }

}