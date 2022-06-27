import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
// transações recentes
  final List<Transaction> recentTransaction;

//passar para um contrutor e para calcular um valor total
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

////// fazer soma de valor acima de 9.99 encima do que foi passado dentro de recentTransaction
      double totalSum = 0.0;

      for(var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;
      
        if(sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay)[0], 
        'value': totalSum, // soma total
      };
      // calcular valor total e identificar qual transação caiu
      // em qual dia da semana
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
