



import 'package:eoffice/helpdesk/page_helpdesk.dart';
import 'package:eoffice/helper/app_helper.dart';
import 'package:eoffice/helper/page_route.dart';
import 'package:eoffice/page_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';


class Home extends StatefulWidget{

  @override
  _Home createState() => _Home();
}


class _Home extends State<Home> {

  String getKaryawanNama, getKaryawanCabang, getKaryawanJabatan, getKaryawanID   = "...";
  _startingVariable() async {
    await AppHelper().getSession().then((value){if(value[5] != 1) {
      Navigator.pushReplacement(context, ExitPage(page: PageLogin()));
      } else{setState(() {
        getKaryawanNama = value[1];
        getKaryawanCabang = value[2];
        getKaryawanJabatan = value[3];
        getKaryawanID = value[4];
      });
    }});
  }

  prepareData() async {
    await _startingVariable();
  }

  @override
  void initState() {
    super.initState();
    prepareData();
  }


  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.setString("username", null);
      preferences.setString("karyawan_nama", null);
      preferences.setString("karyawan_cabang", null);
      preferences.setString("karyawan_jabatan", null);
      preferences.setString("karyawan_id", null);
      preferences.commit();
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => PageLogin()));
    });
  }





  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (context) => IconButton(
                icon: new Icon(Icons.menu),
                color: Colors.black,
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Text("Miracle EOffice",style: TextStyle(
                    color: Colors.black,
            ),),
            actions: [
                  InkWell(
                    child: Padding(padding: const EdgeInsets.all(15),
                    child: FaIcon(FontAwesomeIcons.fontAwesomeAlt,color: Colors.black,),),
                    onTap: (){
                      signOut();
                    },
                  )
            ],
          ),
            drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: HexColor("#075e55"),
                    ),
                    accountName: new Text(getKaryawanNama.toString(),
                        style: TextStyle(fontSize: 18)),
                    accountEmail: new Text(getKaryawanJabatan.toString()),
                    currentAccountPicture: new CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/eoffice2.png"),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                    ),
                    title:
                    Text('Logout', style: TextStyle(fontFamily: 'VarelaRound', fontSize: 18)),
                    onTap: () {
                      signOut();
                    },
                  )
                ],
              ),
            ),
          body : Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 10,right: 10),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(padding: const EdgeInsets.only(top: 10,left: 10),
                      child: Text("Selamat Datang ",style: GoogleFonts.varelaRound(
                          fontWeight: FontWeight.bold,
                      fontSize: 22),),),
                    ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(padding: const EdgeInsets.only(left: 10,top: 5),
                    child: Text(getKaryawanNama,style: GoogleFonts.openSans(
                        fontSize: 15),),),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(padding: const EdgeInsets.only(left: 10,top: 5),
                    child: Text("("+getKaryawanCabang+")",style: GoogleFonts.openSans(
                        fontSize: 15),),),
                ),

                Padding(padding: const EdgeInsets.only(top: 20,right: 10),
                  child: Container(
                    height: 5,
                    color: HexColor("#DDDDDD"),
                  )
                ),

                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Wrap(
                    spacing: 40,
                      children: [
                        Padding(
                            padding : const EdgeInsets.only(top:40, ),
                            child :
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                   // Navigator.push(context, ExitPage(page: PageHelpdesk(getKaryawanID.toString())));
                                    Navigator.of(context).push(new MaterialPageRoute(
                                        builder: (BuildContext context) => PageHelpdesk(getKaryawanID.toString())));
                                  },
                                  child : Container(
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Color(0xffFDCF09),
                                      child: CircleAvatar(
                                        radius: 22,
                                        backgroundImage: AssetImage("assets/eoffice2.png"),
                                      ),
                                    )
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top : 10),
                                    child : Text("Helpdesk", style: TextStyle(fontFamily: 'VarelaRound',
                                        fontSize: 13),)
                                )
                              ],
                            )
                        ),


                        Padding(
                            padding : const EdgeInsets.only(top:40, ),
                            child :
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    //Navigator.push(context, ExitPage(page: Regional()));
                                  },
                                  child : Container(
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Color(0xffFDCF09),
                                        child: CircleAvatar(
                                          radius: 22,
                                          backgroundImage: AssetImage("assets/eoffice2.png"),
                                        ),
                                      )
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top : 10),
                                    child : Text("Konsultasi", style: TextStyle(fontFamily: 'VarelaRound',
                                        fontSize: 13),)
                                )
                              ],
                            )
                        ),



                        Padding(
                            padding : const EdgeInsets.only(top:40, ),
                            child :
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    //Navigator.push(context, ExitPage(page: Regional()));
                                  },
                                  child : Container(
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Color(0xffFDCF09),
                                        child: CircleAvatar(
                                          radius: 22,
                                          backgroundImage: AssetImage("assets/eoffice2.png"),
                                        ),
                                      )
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top : 10),
                                    child : Text("Konsultasi", style: TextStyle(fontFamily: 'VarelaRound',
                                        fontSize: 13),)
                                )
                              ],
                            )
                        ),


                        Padding(
                            padding : const EdgeInsets.only(top:40, ),
                            child :
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    //Navigator.push(context, ExitPage(page: Regional()));
                                  },
                                  child : Container(
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Color(0xffFDCF09),
                                        child: CircleAvatar(
                                          radius: 22,
                                          backgroundImage: AssetImage("assets/eoffice2.png"),
                                        ),
                                      )
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top : 10),
                                    child : Text("Konsultasi", style: TextStyle(fontFamily: 'VarelaRound',
                                        fontSize: 13),)
                                )
                              ],
                            )
                        ),



                      ],
                  ),
                )


              ],
            ),
          )
        );
  }
}