import 'package:flutter/material.dart';
import 'package:jood/services/auth.dart';

class SignIn extends StatefulWidget {

  // final Function toggleView;
  // SignIn({required this.toggleView});


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[],
      ),
      body: ListView(
        children: [
          Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
              key: _formKey,
    child: Column(
    children: <Widget>[
        SizedBox(height: 50.0),
        Icon(
          Icons.perm_identity_rounded,
          size: 60,
          color: Colors.black,
        ),
        SizedBox(height: 50.0),
        TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
          hintText: 'Email', // Add your placeholder text
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0), // Set the border radius here
                  borderSide: BorderSide(color: Color(0xFF3C312B).withOpacity(0.10), width: 2.0)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), // Set the border radius here
                  borderSide: BorderSide(color: Color(0xFF3C312B).withOpacity(0.75), width: 2.0)
              )
        ),
          validator: (val) => val!.isEmpty ? 'Enter an email': null,

          onChanged: (value){
  setState(() {
    email = value;
  });
          },
        ),
        SizedBox(height: 30.0),
        TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Password', // Add your placeholder text
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0), // Set the border radius here
                    borderSide: BorderSide(color: Color(0xFF3C312B).withOpacity(0.10), width: 2.0)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Set the border radius here
                    borderSide: BorderSide(color: Color(0xFF3C312B).withOpacity(0.75), width: 2.0)
                )
            ),
            validator: (val) => val!.length<6 ? 'Enter a password 6+ chars long': null,

            obscureText: true,
          onChanged: (val){
  setState(() {
    password = val;
  });
          }
        ),
        SizedBox(height:50.0),
        ElevatedButton(
            onPressed: () async{
              if(_formKey.currentState!.validate()){
                dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                if(result == null){
                  setState(() {
                    error = 'Your email or password is wrong';
                  });
                }
                else {
                  print('Successfully signed in. Navigating back...');
                  Navigator.pop(context);
                }
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3C312B).withOpacity(0.75),),
              foregroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFFFCC)),
              minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
            ),
            child: Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
        ),
            Text(
            error,
          )
    ],
    )
    )),])
    );
  }
}