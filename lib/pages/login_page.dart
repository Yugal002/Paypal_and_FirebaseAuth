import 'package:flutter/material.dart';
import 'package:paypal_task/auth/AuthenticationProvider.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Handling signup and signin
  bool signUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70,),
                Text('Welcome To Firebase Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          size: 20,
                         // color: Colors.blue,
                        ),
                        labelText: 'Email',
                       // labelStyle: TextStyle(color: Colors.blue)
                      ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email required';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          size: 20,
                          //color: Colors.blue,
                        ),
                        labelText: 'Password',
                       // labelStyle: TextStyle(color: Colors.blue)
                       ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password required';
                      }
                      return null;
                    },
                  ),
                ),

                //Sign in / Sign up button
                Padding(
                  padding: const EdgeInsets.all(18.0)/1.2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Colors.deepPurple,
                      onPressed: () {
                     if (_formKey.currentState.validate()) {
                       if (signUp) {
                         //Provider sign up method
                         context.read<AuthenticationProvider>().signUp(
                           email: emailController.text.trim(),
                           password: passwordController.text.trim(),
                         );
                       } else {
                         //Provider sign in method
                         context.read<AuthenticationProvider>().signIn(
                           email: emailController.text.trim(),
                           password: passwordController.text.trim(),
                         );
                       }
                     }
                      },
                      child: signUp ? Text("Sign Up", style: TextStyle(color: Colors.white),) : Text("Sign In", style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
                SizedBox(height: 40,),

                GestureDetector( //OutlineButton
                  onTap: () {
                    setState(() {
                      signUp = !signUp;
                    });
                  },
                  child: signUp ? Text("Have an account? Sign In") : Text("Create an account."),
                )

              ],

            ),
          ),
        ),
      ),
    );

  }

}