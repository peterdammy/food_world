class RecentOrderModel {
  final String orderId;
  final double amount;
  final String payDate;
  final bool isCompleted; // true = green tick, false = yellow refresh

  RecentOrderModel({
    required this.orderId,
    required this.amount,
    required this.payDate,
    required this.isCompleted,
  });
}
