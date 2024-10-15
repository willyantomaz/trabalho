import 'package:flutter/material.dart';
import 'package:mobile/screen/transacoes.dart';

import '../model/transacao.dart';
import '../service/transacoes_service.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

  final TextEditingController valorController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transacão"),
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 600,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Valor",
                  ),
                  controller: valorController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Tipo",
                  ),
                  controller: tipoController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    double valor = double.parse(valorController.text);

                    var api = TransacoesService();
                    api.postTransacoes(valor, tipoController.text);

                    List<Transacao> transacoes = await api.getTransacoes();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Transacoes(
                          transacoes: transacoes,
                        ),
                      ),
                    );
                  },
                  child: const Text("Enviar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
