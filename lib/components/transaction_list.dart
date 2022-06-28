import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
//////////////// mostrará caso não tenha nenhuma transação
          ? Column(
              children: <Widget>[
                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                    height:
                        20), // dá espaço entre o texto e o container (imagem nesse caso)
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
//////////////// caso contrário. mostrará as novas transações
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Text('R\${tr.value}'),
                  ),
                );
              }),
    );
  }
}
