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
                SizedBox(height: 20), // dá espaço entre o texto e o container (imagem nesse caso)
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
                return Card(
                  child: Row(
                    // usado quando os widg estiverem próximos ou acima um do outro
                    children: <Widget>[
                      Container(
                        // perfeito para alinhamento e estilo personalizado
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      Column(
                        //alinhamento, mas sem opção de estilo - aceita uma lista de widg. como filhos
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tr.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}