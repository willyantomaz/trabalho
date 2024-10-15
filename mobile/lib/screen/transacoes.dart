import 'package:flutter/material.dart';
import 'package:mobile/model/transacao.dart';

class Transacoes extends StatelessWidget {
  final List<Transacao> transacoes;

  Transacoes({
    super.key,
    required this.transacoes,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transações"),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: transacoes.length,
          itemBuilder: (BuildContext context, int index) {
            return const Card(
              child: Card(
                child: ListTile(
                  title: Text("Transação 1"),
                  subtitle: Text("Valor: 100.00"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
