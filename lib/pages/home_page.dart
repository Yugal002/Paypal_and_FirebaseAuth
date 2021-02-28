import 'package:paypal_task/auth/AuthenticationProvider.dart';
import 'paypal_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paypal_task/pages/paypal_payment_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'PAYPAL',
          style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Open Sans'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RaisedButton(
              color: Colors.blueGrey,
              onPressed: () {
                context.read<AuthenticationProvider>().signOut();
              },
              child: Text("Sign out", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text("WELCOME",style:TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Text(firebaseUser.email,style:TextStyle(fontSize: 20, color: Colors.green)),
              SizedBox(height: 20),


              Container(
                width: 200,
                height: 130,
                child: Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text('Samsung Product',style:TextStyle(fontSize: 18, color: Colors.deepOrange)),
                        Text("Price: \$" + "1.99",style:TextStyle(fontSize: 16, color: Colors.green)),
                        SizedBox(height: 20),
                        RaisedButton(
                          color: Colors.deepPurple,
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => PaypalPayment(
                                  onFinish: (number) async {
                                    // payment done
                                    print('order id: '+number);
                                  },
                                ),
                              ),
                            );

                            /* Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PaypalPayment()));*/
                          },
                          child: Text('Buy Now', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    )),
              ),

            ],
          ),
        ),
      ),
    );
  }
}