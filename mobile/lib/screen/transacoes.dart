import 'package:flutter/material.dart';
import 'package:mobile/model/transacao.dart';

import 'editor.dart';
import '../service/transacoes_service.dart';

class Transacoes extends StatefulWidget {
  final List<Transacao> transacoes;

  Transacoes({
    super.key,
    required this.transacoes,
  });

  @override
  State<Transacoes> createState() => _TransacoesState();
}

class _TransacoesState extends State<Transacoes> {

  var api = TransacoesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transações"),
      ),
      body: ListView.builder(
        itemCount: widget.transacoes.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(widget.transacoes[index].tipo),
              subtitle: Text(widget.transacoes[index].valor.toString()),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  api.deleteId(widget.transacoes[index].id);
                  setState(() {
                    widget.transacoes.removeAt(index);
                  });
                },
              ),
              leading: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Editor(
                        transacao: widget.transacoes[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
