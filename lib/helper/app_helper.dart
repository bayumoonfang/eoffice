


import 'package:eoffice/helper/session.dart';

class AppHelper {

  String applink = "https://eoffice.miracle-clinic.com/mobile/api_script.php?";

  Future<dynamic> getSession () async {
    String getUsername = await Session.getUsername();
    String getKaryawanNama = await Session.getKaryawanNama();
    String getKaryawanCabang = await Session.getKaryawanCabang();
    String getKaryawanJabatan = await Session.getKaryawanJabatan();
    String getKaryawanID = await Session.getKaryawanID();
    int getValue = await Session.getvalue();
    return [getUsername,getKaryawanNama,getKaryawanCabang,getKaryawanJabatan,getKaryawanID,getValue];
  }



}