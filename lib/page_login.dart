



import 'package:eoffice/helper/app_helper.dart';
import 'package:eoffice/page_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PageLogin extends StatefulWidget {

  @override
  _PageLogin createState() => new _PageLogin();
}


class _PageLogin extends State<PageLogin> {

  TextEditingController userValue = TextEditingController();
  TextEditingController passwordValue = TextEditingController();
  bool _isVisible = false;

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }


  savePref(int value, String userValue, String KaryawanNama, String KaryawanCabang, String karyawanJabatan, String karyawanID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("username", userValue);
      preferences.setString("karyawan_nama", KaryawanNama);
      preferences.setString("karyawan_cabang", KaryawanCabang);
      preferences.setString("karyawan_jabatan", karyawanJabatan);
      preferences.setString("karyawan_id", karyawanID);
      preferences.commit();
    });
  }



  void cekLogin() async {
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

     final response = await http.post(AppHelper().applink+"do=cek_login",
         body: {
            "a": userValue.text,
            "b": passwordValue.text.toString()
          });
     Map showdata = jsonDecode(response.body);
     setState(() {
       if(showdata["value"].toString() == "1") {
         savePref(1,
             showdata["username"].toString(),
             showdata["karyawan_nama"].toString(),
             showdata["karyawan_cabang"].toString(),
             showdata["karyawan_jabatan"].toString(),
             showdata["karyawan_id"].toString());
         _isVisible = false;
         Navigator.of(context).pushReplacement(new MaterialPageRoute(
             builder: (BuildContext context) => Home()));
       } else {
         _isVisible = false;
         showToast("Username atau Password Salah..", gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
         return;
       }

     });


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

                  Visibility(
                    visible: _isVisible,
                    child:       Padding(padding: const EdgeInsets.only(top: 30,bottom: 10),
                      child: CircularProgressIndicator(),)
                  )

              ,

              Padding(padding: const EdgeInsets.only(top: 40,left: 35,right: 35),
              child: Container(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.red,
                  elevation: 0,
                  child: Text("Login",style: TextStyle(color: Colors.white),),
                  onPressed: (){
                      setState(() {
                        _isVisible = true;
                      });
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