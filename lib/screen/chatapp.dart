


import 'package:flutter/material.dart';

class chatapp extends StatefulWidget {


  @override
  State<chatapp> createState() => _chatappState();
}

class _chatappState extends State<chatapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chatapp"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){},
          child: Text("chat"),
        ),
      ),
    );
  }
}
