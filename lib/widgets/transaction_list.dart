import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final Function deleteTx;

  List<Transaction> userTransactions;
  TransactionList({this.userTransactions, this.deleteTx});



  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 750,
        child: userTransactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transactions add yet',
                    style: Theme.of(context).textTheme.title,
                  )
                ],
              )
            : ListView.builder(

                itemBuilder: (ctx, idx) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                        leading: CircleAvatar(
                            radius: 30,
                            child: Padding(
                                padding: EdgeInsets.all(6),
                                child: FittedBox(
                                    child: Text('\$${userTransactions[idx].amount}'),
                                ))),
                          title:  Text(userTransactions[idx].title),
                          subtitle: Text(
                            DateFormat.yMMMd().format(userTransactions[idx].date)
                          ),
                          trailing: IconButton(icon:Icon(Icons.delete),
                              onPressed: () => deleteTx(userTransactions[idx].id),
                            color: Theme.of(context).errorColor
                          ),
                    ),
                  );
                },
                itemCount: userTransactions.length,
              ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: userTransactions.map((tx) {
  //       return Card(
  //           child: Row(
  //         // mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           Container(
  //               margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  //               decoration: BoxDecoration(
  //                   border: Border.all(color: Colors.deepPurple, width: 2)),
  //               padding: EdgeInsets.all(5),
  //               child: Text(
  //                 '\$${tx.amount}',
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   color: Colors.deepPurple,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               )),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Container(
  //                   child: Text(tx.title,
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.bold,
  //                       ))),
  //               Container(
  //                   child: Text(DateFormat("yyyy-mon-dd").format(tx.date),
  //                       style: TextStyle(
  //                         fontSize: 10,
  //                         color: Colors.grey,
  //                         fontWeight: FontWeight.bold,
  //                       ))),
  //             ],
  //           )
  //         ],
  //       ));
  //     }).toList(),
  //   );
  // }
}
