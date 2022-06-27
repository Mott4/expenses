
class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

// construtor com todos os atributos em *requeridos*
  Transaction({
    // par de chaves para informar *atributos nomeados*
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}