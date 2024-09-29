class Expense {
  String id;
  final String name;
  final int amount;
  final String date;

  Expense({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
  });

  // Convert a JSON map to an Expense object
  factory Expense.fromJson(String id,Map<String, dynamic> json) {
    return Expense(
      id: id,
      name: json['name'] as String,
      amount: (json['amount'] as num).toInt(),
      date: json['date'] as String,
    );
  }

  // Convert an Expense object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'date': date,
    };
  }
}