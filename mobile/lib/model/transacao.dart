class Transacao {
  String id;
  double valor;
  String tipo;

  Transacao(
    this.id,
    this.valor,
    this.tipo,
  );

  factory Transacao.fromJson(Map<String, dynamic> json) {
    return Transacao(
        json['id'] as String,
        json['valor'] as double,
        json['tipo'] as String
    );
  }
}
