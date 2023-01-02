import 'package:flutter/material.dart';
import '../provider/lrprovider.dart';

class Register_Page extends StatefulWidget {
  const Register_Page({Key? key}) : super(key: key);

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  TextEditingController e1 = TextEditingController();
  TextEditingController p1 = TextEditingController();
  LProvider hprovider = LProvider();
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Register"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: e1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("E-mail"),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: p1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("password"),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  var re = await hprovider.createuser(e1.text, p1.text);
                  print(re);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("$re"),
                    ),
                  );
                  if (re == "Success") {
                    Navigator.pushReplacementNamed(context, 'home');
                    hprovider.cheakUser();
                  }
                },
                child: Text("Sign up"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
