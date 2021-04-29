import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(title: 'Personal Expenses'),
      theme: ThemeData( 
        primaryColor: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith( 
          title: TextStyle( 
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
          button: TextStyle(color:Colors.white)
        ),
        appBarTheme: AppBarTheme( 
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle( 
              fontFamily: 'OpenSans',
              fontSize:20,
              fontWeight: FontWeight.bold
            )
          )
        )
        
      ),
      
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String titleInput;
String amountInput;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              width: double.infinity,
              child:
                  Card(color: Colors.blue, elevation: 5, child: Text('CHART'))),
              UserTransaction()
        ],
      ),
    );
  }
}
