import 'package:flutter/foundation.dart';

class Transaction {
  @required String title;
  @required String id;
  @required double amount;
  @required DateTime date;

  Transaction({this.amount, this.id, this.date, this.title});
}
