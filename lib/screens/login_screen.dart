import 'package:string_validator/string_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klass_korporate/screens/registration_screen.dart';
import 'package:klass_korporate/screens/widgets/roundButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:klass_korporate/screens/widgets/textformfield.dart';
import 'package:klass_korporate/services/networking.dart';
import 'package:klass_korporate/screens/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:klass_korporate/services/networking.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _ema = TextEditingController();
  final OutlineInputBorder boarder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(30.0));

  Networking networking = Networking();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pass.dispose();
    _ema.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    networking.getNGOData();
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 80.0,
                    ),
                    Container(
                        height: 120.0, child: Image.asset('images/klass.png')),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: MyCustomTextForm(
                        hintText: 'Email',
                        textInputType: TextInputType.emailAddress,
                        isPassword: false,
                        textEditingController: _ema,
                        outlineInputBorder: boarder,
                        validator: (value) {
                          if (!isEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: MyCustomTextForm(
                        hintText: 'Password',
                        isPassword: true,
                        maxLine: 1,
                        outlineInputBorder: boarder,
                        textEditingController: _pass,
                        validator: (_value) {
                          if (_value.isEmpty) {
                            return 'Password connot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    RoundedButton(
                      title: 'Login',
                      colour: Theme.of(context).primaryColor,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          email = _ema.text;
                          password = _pass.text;

                          try {
                            setState(() {
                              showSpinner = true;
                            });
                            await networking.authLogin(
                                email: email, password: password);
                            Navigator.popAndPushNamed(context, HomePage.id);
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            setState(() {
                              showSpinner = false;
                            });
                            print(e);
                            return showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('An Error Occured'),
                                  content: Text(e.toString()),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Don\'t have an account?',
                                style: TextStyle(fontSize: 17.0),
                              ),
                              FlatButton(
                                child: Text(
                                  'Register Now',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 17.0),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RegistrationScreen.id);
                                },
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Forgot Password?',
                                style: TextStyle(fontSize: 17.0),
                              ),
                              FlatButton(
                                child: Text(
                                  'Reset Password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 17.0),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//  Future<void> getServiceDetailsData() async {
//    String url = 'https://klasskorporate.com/api/orders/18';
//    http.Response response = await http.get(url);
//    Map<String, dynamic> decodedData = json.decode(response.body);
//    print('status code is =${response.statusCode}');
//  }
}
//
//Future getC() async {
//
//    http.Response response =
//    await http
//        .get('https://typedev.pythonanywhere.com/products/products/',
//        headers: {'Content-Type': 'application/json'});
//   var decodedResponse = jsonDecode(response.body);
//    print(decodedResponse);
//    print(response.statusCode);
//    // for (int i = 0; i < decodedResponse.length; i++) {
//
//}
