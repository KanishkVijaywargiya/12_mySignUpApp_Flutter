import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;

  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String name, email, password, mobile, collegename;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Image(
                  image: AssetImage("images/logo.png"),
                  width: 100.0,
                  height: 100.0,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Enter Name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    onSaved: (input) => name = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Enter Email';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    onSaved: (input) => email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Enter password';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'password',
                    ),
                    obscureText: _obscureText,
                    onSaved: (input) => password = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone_android),
                  title: TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Enter Mobile';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                    ),
                    onSaved: (input) => mobile = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: TextFormField(
                    validator: (input){
                      if(input.isEmpty){
                        return 'Enter College Name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'College Name',
                    ),
                    onSaved: (input) => collegename = input,
                  ),
                ),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 200.0,
                  child: RaisedButton(
                    onPressed: _sendToNextScreen,
                    color: Colors.redAccent,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  // padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendToNextScreen(){
    if(_key.currentState.validate()){
      //saves to global key
      _key.currentState.save();
      //send to next screen
      Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => HomePage(
            name: name,
            mobile: mobile,
            email: email,
            password: password,
            collegename: collegename
          )
        )
      );
    } else{
      setState(() {
        _autovalidate = true;
      });
    }
  }
}