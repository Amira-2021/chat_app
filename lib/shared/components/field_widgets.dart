
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textFormField ({
  required TextInputType type,
  required String text,
  required IconData icon,
  bool isSecure=false,
  required String input,
  TextEditingController? controller
})=>
    Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        validator: (text){
          if(text!.trim() ==""){
            return "please enter "+ input;
          }else{
            return "";
          }
        },
        textInputAction: TextInputAction.next,
        cursorColor: Colors.black,
        cursorHeight: 20,
        obscureText: isSecure,
        obscuringCharacter: "*",
        keyboardType: type,
        style: TextStyle(fontSize: 19),
        decoration:InputDecoration(
          hintText: text,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.blue
            ),
          ),
          disabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: Colors.blue
            ),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: Colors.blue
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: Colors.blue
            ),
          ),
          focusedErrorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: Colors.blue
            ),
          ) ,
          prefixIcon: Icon(icon,color: Colors.blue,size: 29,),
          hintStyle: TextStyle(
            fontSize: 20
          )
        ),
      ),

    );