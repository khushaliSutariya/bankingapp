import 'package:bankingapp/Screens/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController _pin = TextEditingController();
  TextEditingController _conformpin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("loginpage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Pin"),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter your Email address';
                }
                if (!RegExp(r"^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}$")
                    .hasMatch(value)) {
                  return 'Enter a Valid pin ';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              controller: _pin,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10.0,),
            Text("Conform Pin"),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if(value!.isEmpty){
                 return "please enter your right pin";
                }
                if(_conformpin==_pin){
                  return "Please check your pin";
                }
                return null;
              },
              controller: _conformpin,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(onPressed: () async {
              SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.setString("pin", _pin.text.toString());
              prefs.setBool("loggedIn", true);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepage(),));
            }, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
