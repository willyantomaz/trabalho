import 'package:flutter/material.dart';

import '../model/transacao.dart';
import 'transacoes.dart';
import '../service/transacoes_service.dart';

class Editor extends StatelessWidget {
  Transacao transacao;

  Editor({
    super.key,
    required this.transacao,
  });

  final TextEditingController valorController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Novo Valor",
            ),
            controller: valorController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Novo Tipo",
            ),
            controller: tipoController,
          ),
          ElevatedButton(
            onPressed: () async {
              double valor = double.parse(valorController.text);
              var api = TransacoesService();
              await api.putTransacoes(valor, tipoController.text, transacao.id);
              List<Transacao> transacoes = await api.getTransacoes();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Transacoes(
                    transacoes: transacoes,
                  ),

                ),
                (route) => false,
              );
            },
            child: const Text("Enviar"),
          ),
        ],
      ),
    );
  }
}
