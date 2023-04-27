import 'package:chatapp/screens/account/connector.dart';
import 'package:chatapp/screens/account/create_account_viewmodel.dart';
import 'package:chatapp/screens/home/home_screen.dart';
import 'package:chatapp/shared/components/field_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  static const String routeNamed="account";

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>  implements Connector{
  GlobalKey<FormState> formKey =GlobalKey<FormState>();

  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  creeteAccountViewModel viewModel =creeteAccountViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.connector=this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> viewModel,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Image.asset('assets/images/splash/background.png',fit: BoxFit.fill,
          width: double.infinity,
              height: double.infinity,
          ),
          Scaffold(
         backgroundColor: Colors.transparent,
         appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Create Account",style: TextStyle(
            fontSize: 30
          ),),
          centerTitle: true,
        ),
         body:Container(
           margin: EdgeInsets.only(top: 180),
           child: SingleChildScrollView(
             child: Form(
               key: formKey,
                 child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 textFormField(type: TextInputType.text,text: "user name",icon: Icons.person,input: "name"),
                 textFormField(type: TextInputType.text,text: "email",icon: Icons.email,input: "email",controller: emailController),
                 textFormField(type: TextInputType.text,text: "phone number",icon: Icons.phone,input: "phone"),
                 textFormField(type: TextInputType.text,text: "password",isSecure: true,icon: Icons.lock,input: "password",controller: passwordController),
                 SizedBox(height: 10,),
                 Container(
                   width: 250,
                   height: 45,
                   child: ElevatedButton(
                     onPressed: (){
                        createAccount(emailController,passwordController);
                   }, child: Text("Login",style: TextStyle(fontSize: 20,),
                   ),
                   ),
                 )

                 ],
             )),
           ),
         ),

      )
        ],
      ),
    );

  }

 void createAccount(email,password)async{
    if(formKey.currentState!.validate()==false){
        viewModel.createAccountFirebaseAuth(emailController.text, passwordController.text);
    }
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading() {
    showDialog(context: context, builder:(context){
      return Center(child: CircularProgressIndicator(),);
    });
  }

  @override
  void showMessage(String message,Color color) {
    showDialog(context: context, builder:(context){
    return  AlertDialog(
      content: Text(message),contentTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: color
    ),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Cancle")),
        ElevatedButton(onPressed: (){
          Navigator.pushReplacementNamed(context, HomeScreen.routeNamed);
        }, child: Text("Ok")),
      ],
    );
      
    });

  }
  
}
