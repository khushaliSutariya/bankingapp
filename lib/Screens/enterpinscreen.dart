import 'package:flutter/material.dart';

class enterpinscreen extends StatefulWidget {
  const enterpinscreen({Key? key}) : super(key: key);

  @override
  State<enterpinscreen> createState() => _enterpinscreenState();
}

class _enterpinscreenState extends State<enterpinscreen> {
  TextEditingController _enterpin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Enter pin"),
          TextFormField(
            controller: _enterpin,
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Login"))
        ],
      ),
    );
  }
}
