import 'package:flutter/material.dart';
import 'screen.dart';

final ciphers = [
  'BEAUFORT CIPHER',
  'CAESAR CIPHER',
  'KEYWORD CIPHER',
  'PLAYFAIR CIPHER',
  'RAIL FENCE CIPHER',
  'VIGENERE CIPHER',
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('CIPHERS', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: ciphers.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.015,
                  left: MediaQuery.of(context).size.height * 0.015,
                  right: MediaQuery.of(context).size.height * 0.015,
                ),
                child: ListTile(
                  onTap: () {
                  Navigator.push( context, 
                  MaterialPageRoute( builder: (context) => Screen(title: ciphers[index])));
                  },
                  leading: Icon(Icons.lock, color: Colors.black),
                  title: Text(ciphers[index]),
                ),
              );
            }
          )
        );
      }
    }
