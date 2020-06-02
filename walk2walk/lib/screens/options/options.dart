import 'package:flutter/material.dart';

class Options extends StatefulWidget {

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurations')
      )
    );
  }
}