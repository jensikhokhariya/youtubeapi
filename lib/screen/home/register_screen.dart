import 'package:flutter/material.dart';
import 'package:youtubeapi/screen/provider/lrprovider.dart';

class Register_Page extends StatefulWidget {
  const Register_Page({Key? key}) : super(key: key);

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  TextEditingController e1 = TextEditingController();
  TextEditingController p1 = TextEditingController();
  LProvider hprovider = LProvider();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                  var res = await hprovider.createuser(e1.text, p1.text);
                  print(res);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("$res"),
                    ),
                  );
                  if (res == "Success") {
                    Navigator.pushReplacementNamed(context, 'log');
                  }
                },
                child: Text("Sign in"),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  hprovider.googleSignIn();
                },
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShJvJeICVmrqFtHG1UX9TC8qPMJwuN-K3sUy9JdmHfulwwNg6AfanEyvXV_1I8qvmbRw&usqp=CAU"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
