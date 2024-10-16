class Novatransacaodto {
  double valor;
  String tipo;

  Novatransacaodto(
    this.valor,
    this.tipo
  );

  Map<String,dynamic> toJson() {
    return {
      'valor':valor,
      'tipo':tipo
    };
  }
  
}