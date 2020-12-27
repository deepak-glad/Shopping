import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login(this.submitFn, this.isLoading);
  final bool isLoading;
  final void Function(String username, String email, String password,
      bool isLogin, BuildContext ctx) submitFn;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  var _username = '';
  var _email = '';
  var _password = '';

  void _trysave() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      print(_username);
      print(_password);
      print(_email);
      widget.submitFn(
        _username.trim(),
        _email.trim(),
        _password.trim(),
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context);
    return Stack(
      children: [
        Container(
          color: Colors.blueAccent,
        ),
        Container(
          margin: EdgeInsets.only(top: 150, left: 50),
          height: _isLogin
              ? devicesize.size.height / 2 - 20
              : (devicesize.size.height / 2) + 25,
          width: (devicesize.size.width * 3) / 4,
          // color: Colors.white,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (_isLogin)
                    Text(
                      'Hello!',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  if (!_isLogin)
                    Text(
                      'WelCome!',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter atleast 4 characters ';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _username = value;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'USERNAME',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  SizedBox(height: 10),
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty) return 'Please enter password';
                      return null;
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                    // keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  SizedBox(height: 20),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    RaisedButton(
                      color: _isLogin ? Colors.cyan : Colors.cyan,
                      child: Text(_isLogin ? 'LOGIN' : 'SINGUP'),
                      onPressed: _trysave,
                    ),
                  if (!widget.isLoading)
                    FlatButton(
                      child: Text(_isLogin
                          ? 'Create New Account'
                          : 'Already have account'),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
