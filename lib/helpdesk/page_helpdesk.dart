


import 'package:eoffice/helper/app_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class PageHelpdesk extends StatefulWidget {
  final String karyawanID;
  const PageHelpdesk(this.karyawanID);
  @override
  _PageHelpdesk createState() => _PageHelpdesk();
}


class _PageHelpdesk extends State<PageHelpdesk> {


  Future<bool> _onWillPop() async {
    Navigator.pop(context);
  }

  String getFilter = "";
  Future<List> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull(AppHelper().applink+"do=getdata_helpdesk&filter="+getFilter),
        headers: {"Accept":"application/json"}
    );
    return json.decode(response.body);
  }




  @override
  Widget build(BuildContext context) {
        return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
               appBar: new AppBar(
                 backgroundColor: Colors.white,
                 leading: Builder(
                   builder: (context) => IconButton(
                       icon: new Icon(Icons.arrow_back),
                       color: Colors.black,
                       onPressed: () => {
                         Navigator.pop(context)
                       }),
                 ),
                 title: Text("Helpdesk",style: TextStyle(color: Colors.black),),
               ),
                body: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(left: 15,top: 10,
                          right: 15),
                          child: Container(
                            height: 42,
                            child: TextFormField(
                              enableInteractiveSelection: false,
                              onChanged: (text) {
                                setState(() {
                                  getFilter = text;
                                  //_isvisible = false;
                                  //startSCreen();
                                });
                              },
                              style: TextStyle(fontFamily: "VarelaRound",fontSize: 15),
                              decoration: new InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                fillColor: HexColor("#f4f4f4"),
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Icon(Icons.search,size: 18,
                                    color: HexColor("#6c767f"),),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white,
                                    width: 1.0,),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: HexColor("#f4f4f4"),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hintText: 'Cari Helpdesk...',
                              ),
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),),
                           Expanded(
                                child :
                                _datafield()
                            ),
                      Padding(padding: const EdgeInsets.only(bottom:10),)
                    ],
                  )

                )

                ,


                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(right : 10),
                  child: FloatingActionButton(
                    onPressed: (){
                      FocusScope.of(context).requestFocus(FocusNode());
                      //Navigator.push(context, ExitPage(page: ProdukInsert()));
                    },
                    child: FaIcon(FontAwesomeIcons.plus),
                  ),
                )
            ),
        );

  }

  Widget _datafield() {
      return FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                  child: CircularProgressIndicator()
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(snapshot.data[i]["a"]),
                    subtitle: Text(snapshot.data[i]["b"]),
                    trailing: RaisedButton(
                      child: Text(snapshot.data[i]["d"]),
                    ),
                  );
                },
              );
            }
          },
      );
  }


}