import 'package:flutter/material.dart';
import 'logic.dart';

Logic logic = new Logic();
String result;

class Screen extends StatefulWidget {
  final title;

  Screen({this.title});

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      result = '';
    });
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController input = TextEditingController();
  TextEditingController key = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: TextFormField(
                    controller: input,
                    validator: (value) {
                      if (value.isEmpty) 
                        return 'Required';
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        hintText: 'Input'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: TextFormField(
                    controller: key,
                    validator: (value) {
                      if (value.isEmpty) 
                      return 'Required'; 

                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        hintText: 'Key'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton.icon(
                        onPressed: () {
                          if (formKey.currentState.validate())
                            setState(() {
                              result = logic.caesar(
                                  input.text, int.parse(key.text), 1);
                            });
                        },
                        icon: Icon(Icons.lock_outline),
                        label: Text('ENCRYPT'),
                        color: Colors.green,
                        textColor: Colors.white,
                      ),
                      RaisedButton.icon(
                        onPressed: () {
                          if (formKey.currentState.validate())
                            logic.caesar(input.text, int.parse(key.text), 0);
                        },
                        icon: Icon(Icons.lock_open_rounded),
                        label: Text('DECRYPT'),
                        color: Colors.red,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: ListTile(
                      title: Text(
                    'OUTPUT',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: ListTile(
                      title: Text(
                    result,
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
                ),
              ]),
            )
          ],
        ));
  }
}
