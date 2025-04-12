bool isLoggedInUser = false;
bool? isFristTime = true;

class Constant {
  static const String deviceLang = "device_lang";
  static Map<String, dynamic> massageMap(String message) {
    return {
      "message": message,
    };
  }

  static const String employee = "employee";
  static const String mtnAccount = "mtn_account";
  static const String sitesAdmin = "sites_admin";
  static const String manager= "manager";
}

class MapKeys {
//   'RBS1Type'
// 'DU1Type'
// 'RU1Type'
// 'RBS2Type'
// 'DU2Type'
// 'RU2Type'
//  'Remarks'
// "GSM 900"
// "GSM 1800"
  static const String rbs1Type = "rbs_1_type";
  static const String rbs2Type = "rbs_2_type";
  static const String du1Type = "du_1_type";
  static const String du2Type = "du_2_type";
  static const String ru1Type = "ru_1_type";
  static const String ru2Type = "ru_2_type";
  static const String remarks = "remarks";
  static const String gsm900 = "GSM 900";
  static const String gsm1800 = "GSM 1800";
}
// هي اسماء الرولات 
// employee
// mtn_account
// sites_admin
// manager