import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'components/chart.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData myTheme = ThemeData();
    return MaterialApp(
      home: MyHomePage(),
      theme: myTheme.copyWith(
        colorScheme: myTheme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: myTheme.textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          button: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // lista constante
    // Transaction(
    //   id: 't0',
    //   title: 'Conta Antiga',
    //   value: 400.00,
    //   date: DateTime.now().subtract(Duration(days: 33)),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'Novo Tênis de Corrida',
    //   value: 310.76,
    //   date: DateTime.now().subtract(Duration(days: 3)),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Conta de luz',
    //   value: 211.30,
    //   date: DateTime.now().subtract(Duration(days: 4)),
    // ),
    // Transaction(
    //   id: 't3',
    //   title: 'Cartão de Crédito',
    //   value: 100211.30,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't4',
    //   title: 'Lanche',
    //   value: 19.46,
    //   date: DateTime.now(),
    // ),
  ];

  // criação de getter para passar as transações recentes para o nosso componente
  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        // pegar data de AGORA
        const Duration(days: 7),
        // subtrair 7 dias
        // * e se a data for depois de 7 dias atrás, significa q essa transação precisa estar na lista final
      ));
      // se retornar falso, significa que a lista será vazia
      // se retornar a true, significa que todos os elementos vão ser verdadeiros e irão aparecer na lista final
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
    //widget do tipo statefull e tem método estático chamado of
  }

  // método para deletar as transações
  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

//////////// abrir modal para adicionar novas transações
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
        //Transaction pede um parâmetro
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        title: Text('Despesas Pessoais',
        style: TextStyle(
          fontSize: 10 * MediaQuery.of(context).textScaleFactor,
        ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ); 

    final availabelHeight = MediaQuery.of(context).size.height - 
      appBar.preferredSize.height - 
      MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: availabelHeight * 0.4,
              child: Chart(_recentTransactions),
            ),
            Container(
              height: availabelHeight * 0.6,
              child: TransactionList(_transactions, _removeTransaction),
            ),
          ],
        ),
      ),

      //////////// botão flutuante para abri o Modal
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
