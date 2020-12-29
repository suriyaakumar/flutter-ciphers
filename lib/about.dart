import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("ABOUT", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          FlutterLogo(
            size: MediaQuery.of(context).size.height * 0.20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Center(
              child: Text(
                'Flutter v.1.22.4',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03),
              ),
            ),
          ),
          Image.asset(
            'assets/github.png',
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.height * 0.20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
            child: Center(
              child: Text(
                'GitHub Repository',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Text(
              'This GitHub repository will see more ciphers added to it in the future. A link is provided to the repository so that you can see how the ciphers work and also track the repository status.',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.black,
                  child: Text('REPOSITORY'),
                  onPressed: () {
                    launch(
                      'https://github.com/suriyaakumar/flutter-ciphers.git',
                      enableJavaScript: true,
                      forceWebView: false,
                      forceSafariVC: false
                      );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
