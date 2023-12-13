class Transaction {
  final int id;
  final double price;
  final String title;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.price,
      required this.title,
      required this.date});
}
