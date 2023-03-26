import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuis_ptpm/placelist.dart';

TextEditingController getUser = TextEditingController();
TextEditingController getPass = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Groceries Store"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: Colors.blue,
        elevation: 50.0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
                fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      controller: getUser,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukkan email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {},
                      validator: (value) {
                        return value!.isEmpty ? 'Tolong ketik email' : null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      obscureText: true,
                      controller: getPass,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Masukkan password',
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {},
                      validator: (value) {
                        return value!.isEmpty ? 'Tolong ketik password' : null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: MaterialButton(
                        child: const Text('Login'),
                        color: Colors.blue,
                        textColor: Colors.white,
                        minWidth: double.infinity,
                        onPressed: () {
                          String user = 'rain@gmail.com';
                          String pass = '123';
                          if (getUser.text.isEmpty) {
                            const errorUser = SnackBar(
                              content: Text('Username tidak boleh kosong!'),
                              duration: Duration(seconds: 2),
                            );
                            _scaffoldKey.currentState!.showSnackBar(errorUser);
                          } else if (getPass.text.isEmpty) {
                            const errorUser = SnackBar(
                              content: Text('Password tidak boleh kosong!'),
                              duration: Duration(seconds: 2),
                            );
                            _scaffoldKey.currentState!.showSnackBar(errorUser);
                          } else if (getUser.text == user &&
                              getPass.text == pass) {
                            final errorUser = SnackBar(
                              content:
                                  Text('Selamat datang user: ' + getUser.text),
                              duration: const Duration(seconds: 2),
                            );
                            _scaffoldKey.currentState!.showSnackBar(errorUser);
                            Timer(const Duration(seconds: 2), () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      settings: const RouteSettings(
                                        name: "/transition1",
                                      ),
                                      builder: (context) =>
                                          const GroceriesList()));
                            });
                          } else {
                            const errorUser = SnackBar(
                              content: Text('Cek kembali input anda!'),
                              duration: Duration(seconds: 2),
                            );
                            _scaffoldKey.currentState!.showSnackBar(errorUser);
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
