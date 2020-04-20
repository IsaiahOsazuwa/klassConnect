import 'package:flutter/material.dart';
import 'package:klass_korporate/screens/widgets/textformfield.dart';
import 'package:klass_korporate/screens/widgets/roundButton.dart';
import 'package:string_validator/string_validator.dart';
import 'package:klass_korporate/services/networking.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:klass_korporate/screens/home.dart';

class RegistrationScreen extends StatelessWidget {
  static const id = 'registration_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextForm(),
    );
  }
}

class TextForm extends StatefulWidget {
  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  Networking networking = Networking();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmpass = TextEditingController();
  final TextEditingController _first = TextEditingController();
  final TextEditingController _last = TextEditingController();
  final TextEditingController _eml = TextEditingController();
  final TextEditingController _phnb = TextEditingController();
  final OutlineInputBorder boarder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(30.0));
  bool showSpinner = false;
  String firstname;
  String lastname;
  String mobile;
  String passwd;
  String c_password;
  String email;

  @override
  void dispose() {
    _pass.dispose();
    _confirmpass.dispose();
    _phnb.dispose();
    _first.dispose();
    _last.dispose();
    _eml.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Klass and Koporate Consult Int\'l Limited',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Create an Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: MyCustomTextForm(
                            hintText: 'First Name',
                            textEditingController: _first,
                            textInputType: TextInputType.text,
                            isPassword: false,
                            outlineInputBorder: boarder,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter first name.';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: MyCustomTextForm(
                            hintText: 'Last Name',
                            textInputType: TextInputType.text,
                            isPassword: false,
                            textEditingController: _last,
                            outlineInputBorder: boarder,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter last name.';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: MyCustomTextForm(
                            hintText: 'Email',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _eml,
                            isPassword: false,
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
                          padding: EdgeInsets.all(8.0),
                          child: MyCustomTextForm(
                            hintText: 'Phone Number',
                            textInputType: TextInputType.number,
                            textEditingController: _phnb,
                            isPassword: false,
                            outlineInputBorder: boarder,
//                            validator: (value) {
//                              if (value.length < 11) {
//                                return 'Phone number should be 11 digits';
//                              }
//                              return null;
//                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: MyCustomTextForm(
                            hintText: 'Password',
                            textInputType: TextInputType.text,
                            textEditingController: _pass,
                            isPassword: true,
                            maxLine: 1,
                            outlineInputBorder: boarder,
                            onSaved: (_value) {
                              passwd = _value;
                            },
//                            validator: (value) {
//                              if (value.length < 6) {
//                                return 'Password should be a minimum of 6 characters';
//                              }
//                              //
//                              return null;
//                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: MyCustomTextForm(
                            hintText: 'Confirm Password',
                            textInputType: TextInputType.text,
                            textEditingController: _confirmpass,
                            isPassword: true,
                            maxLine: 1,
                            outlineInputBorder: boarder,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Comfirm Password please';
                              }
                              if (value != passwd) {
                                return 'Password did not match';
                              }
                              return null;
                            },
                          ),
                        ),
                        RoundedButton(
                            title: 'Register',
                            colour: Theme.of(context).primaryColor,
                            onPressed: () async {
                              _formKey.currentState.save();
                              if (_formKey.currentState.validate()) {
                                firstname = _first.text;
                                lastname = _last.text;
                                email = _eml.text;
                                passwd = _pass.text;
                                mobile = _phnb.text;
                                c_password = _confirmpass.text;
                                try {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  await networking.authRegister(
                                      firstname: firstname,
                                      lastname: lastname,
                                      email: email,
                                      password: passwd,
                                      mobile: mobile,
                                      cpassword: c_password);
                                  Navigator.pushReplacementNamed(
                                      context, HomePage.id);
                                  setState(() {
                                    showSpinner = false;
                                  });
                                } catch (e) {
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
                                              setState(() {
                                                showSpinner = false;
                                              });
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Already have an Account?',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 17.0),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
