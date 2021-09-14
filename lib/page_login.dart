



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast/toast.dart';



class PageLogin extends StatefulWidget {

  @override
  _PageLogin createState() => new _PageLogin();
}


class _PageLogin extends State<PageLogin> {

  TextEditingController userValue = TextEditingController();
  TextEditingController passwordValue = TextEditingController();


  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  void cekLogin() {
     if (userValue.text == "" && passwordValue.text == "") {
        showToast("Form tidak boleh Kosong", gravity: Toast.BOTTOM, duration: Toast.LENGTH_LONG);
        return;
    }
    else if(userValue.text == "") {
      showToast("Username Kosong", gravity: Toast.BOTTOM, duration: Toast.LENGTH_LONG);
      return;
    } else if (passwordValue.text == "") {
      showToast("Password Kosong", gravity: Toast.BOTTOM, duration: Toast.LENGTH_LONG);
      return;
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/eoffice2.png",width: 300,),
              Padding(padding: const EdgeInsets.only(top: 10,left: 35,right: 35),
              child: TextFormField(
                controller: userValue,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top:2),
                  hintText: 'Username anda...',
                  labelText: '',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(fontFamily: "VarelaRound", color: HexColor("#c4c4c4")),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("#DDDDDD")),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("#8c8989")),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("#DDDDDD")),
                  ),
                ),
              ),),

              Padding(padding: const EdgeInsets.only(top: 40,left: 35,right: 35),
                child: TextFormField(
                  controller: passwordValue,
                  obscureText: true,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top:2),
                    hintText: 'Password anda...',
                    labelText: '',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(fontFamily: "VarelaRound", color: HexColor("#c4c4c4")),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: HexColor("#DDDDDD")),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: HexColor("#8c8989")),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: HexColor("#DDDDDD")),
                    ),
                  ),
                ),),

              Padding(padding: const EdgeInsets.only(top: 40,left: 35,right: 35),
              child: Container(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.red,
                  elevation: 0,
                  child: Text("Login BOsque",style: TextStyle(color: Colors.white),),
                  onPressed: (){
                      cekLogin();
                  },
                ),
              ),)


            ],
          )
      ),
    );

  }
}