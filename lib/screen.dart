import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  inputFormattin() {
    if (widget.title == 'CAESAR CIPHER' || widget.title == 'VIGENERE CIPHER')
      return <TextInputFormatter>[
        new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
      ];
  }

  keyFormattin() {
    if (widget.title == 'CAESAR CIPHER' || widget.title == "RAIL FENCE CIPHER")
      return <TextInputFormatter>[
        new FilteringTextInputFormatter.allow(RegExp("[0-9]"))
      ];
    else if (widget.title == 'VIGENERE CIPHER' ||
        widget.title == 'KEYWORD CIPHER')
      return <TextInputFormatter>[
        new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
      ];
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
                    inputFormatters: inputFormattin(),
                    validator: (value) {
                      if (value.isEmpty) return 'Required';
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
                    inputFormatters: keyFormattin(),
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Required';
                      else if (widget.title == 'RAIL FENCE CIPHER' &&
                          int.parse(value) > input.text.length)
                        return 'Number key should not be bigger than length of text.';
                      else if (widget.title == 'PLAYFAIR CIPHER' &&
                          key.text.length < 6)
                        return 'Playfair key size must atleast be 6 characters long.';
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
                              if (widget.title == "CAESAR CIPHER")
                                result = logic.caesar(
                                    input.text, int.parse(key.text), 1);
                              else if (widget.title == "VIGENERE CIPHER")
                                result =
                                    logic.vigenere(input.text, key.text, 1);
                              else if (widget.title == "RAIL FENCE CIPHER")
                                result = logic.railfenceEncrypt(
                                    input.text, int.parse(key.text));
                              else if (widget.title == "PLAYFAIR CIPHER")
                                result =
                                    logic.playfairEncrypt(input.text, key.text);
                              else if (widget.title == "KEYWORD CIPHER")
                                result =
                                    logic.keywordEncrypt(input.text, key.text);
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
                            setState(() {
                              if (widget.title == "CAESAR CIPHER")
                                result = logic.caesar(
                                    input.text, int.parse(key.text), 0);
                              else if (widget.title == "VIGENERE CIPHER")
                                result =
                                    logic.vigenere(input.text, key.text, 0);
                              else if (widget.title == "RAIL FENCE CIPHER")
                                result = logic.railfenceDecrypt(
                                    input.text, int.parse(key.text));
                              else if (widget.title == "PLAYFAIR CIPHER")
                                result =
                                    logic.playfairDecrypt(input.text, key.text);
                            });
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
