import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtubeapi/screen/home/home_screen.dart';
import 'package:youtubeapi/screen/provider/lrprovider.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController e1 = TextEditingController();
  TextEditingController p1 = TextEditingController();
  LProvider hprovider = LProvider();
  bool login = false;
  // @override
  // void initState() {
  //   super.initState();
  //   ischeck();
  // }
  // void ischeck(){
  //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => login ? Login_Page() : Home_Page()),);
  // }
//
//     @override
//   void initState() {
//     super.initState();
//     login =hprovider.cheakUser();
//   }
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }
//
// void isLogin(){
//     if(login){
//       Navigator.pushReplacementNamed(context, 'home');
//     }
// }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
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
                    // login ? null : () => Home_Page();
                    // authProvider.isAuthenticated ?  HomeScreen() : LoginScreen();
                    Navigator.pushReplacementNamed(context, 'home');
                    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => login ? Login_Page() : Home_Page()),);
                    hprovider.cheakUser();
                  }
                },
                child: Text("Log in"),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  hprovider.googleSignIn();
                },
                child: Image.asset("assets/images/google.png"),
                ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'res');
                },
                child: Text("create account | Sign in"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
