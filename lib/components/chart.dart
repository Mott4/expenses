import 'package:flutter/material.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {

// transações recentes
  final List<Transaction> recentTransaction;

//passar para um contrutor e para calcular um valor total
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      return {'day': 'T', 'value': 9.99 }; 
      // calcular valor total e identificar qual transação caiu
      // em qual dia da semana
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}