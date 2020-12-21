import 'package:flutter/material.dart';
import 'screen.dart';

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
      body: ListView(children: [
        Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.height * 0.0125,
              right: MediaQuery.of(context).size.height * 0.0125,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Screen(title: 'CAESAR CIPHER')));
              },
              child: Column(
                children: [
                  ListTile(
                    trailing: Icon(Icons.info, color: Colors.black),
                    title: Text(
                      'CAESAR CIPHER',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )),
        Card(
            elevation: 15,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.height * 0.0125,
              right: MediaQuery.of(context).size.height * 0.0125,
            ),
            child: InkWell(
              onTap: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Screen(title: 'VIGENERE CIPHER')));
              },
              child: Column(
                children: [
                  ListTile(
                    trailing: Icon(Icons.info, color: Colors.black),
                    title: Text(
                      'VIGENERE CIPHER',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )),
        Card(
            elevation: 15,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.height * 0.0125,
              right: MediaQuery.of(context).size.height * 0.0125,
            ),
            child: InkWell(
              onTap: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Screen(title: 'PLAYFAIR CIPHER')));
              },
              child: Column(
                children: [
                  ListTile(
                    trailing: Icon(Icons.info, color: Colors.black),
                    title: Text(
                      'PLAYFAIR CIPHER',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )),
        Card(
            elevation: 15,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.height * 0.0125,
              right: MediaQuery.of(context).size.height * 0.0125,
            ),
            child: InkWell(
              onTap: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Screen(title:'RAIL FENCE CIPHER')));
              },
              child: Column(
                children: [
                  ListTile(
                    trailing: Icon(Icons.info, color: Colors.black),
                    title: Text(
                      'RAIL FENCE CIPHER',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )),
        Card(
            elevation: 15,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.height * 0.0125,
              right: MediaQuery.of(context).size.height * 0.0125,
            ),
            child: InkWell(
              onTap: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Screen(title: 'KEYWORD CIPHER')));
              },
              child: Column(
                children: [
                  ListTile(
                    trailing: Icon(Icons.info, color: Colors.black),
                    title: Text(
                      'KEYWORD CIPHER',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )),
        Card(
            elevation: 15,    
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),      
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.height * 0.0125,
              right: MediaQuery.of(context).size.height * 0.0125,
            ),
            child: InkWell(
              onTap: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Screen(title: 'BEAUFORT CIPHER')));
              },
              child: Column(
                children: [
                  ListTile(
                    trailing: Icon(Icons.info, color: Colors.black),
                    title: Text(
                      'BEAUFORT CIPHER',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
