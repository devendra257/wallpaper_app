import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/api/my_exception.dart';

class ApiHelper {
  Future<dynamic> getApi(
      {required String url, Map<String, String>? mHeader}) async {
    var mData;
    try {
      var res = await http.get(Uri.parse(url),
          headers: mHeader ??
              {
                "Authorization":
                    "aMDZJHEwVRvmgLkoJWyMmRhiJNEshBcghHz4Txs7SQdOGbZfb5vM5XWZ"
              });

      //* Exception ka response karne ke liye data ko returbDataResponse me pass kiya h..
      mData = returnDataResponse(res);
    }
    //* Agar Apko pta h ki kaise error aane wala h to ap use direct kar skte ho catch ka use karna hoga or agar ni pta h to catch ke element error to thow karega
    on SocketException {
      throw FetchDataException(body: "Internet Error");
    }

    return mData;
  }

//* Handle on all type of Exceptions..
  dynamic returnDataResponse(http.Response response) {
    switch (response.statusCode) {
      //* it working sucessful

      case 200:
        var mData = response.body;
        return jsonDecode(mData);

      //* if bad request for data (Internet erroe)

      case 400:
        throw BadRequestException(body: response.body.toString());

      //* if you r authorised data

      case 401:
      case 403:
        throw UnAuthorisedException(body: response.body.toString());

      //* Seever Error
      case 500:
      default:
        throw FetchDataException(body: "Communcation Error to Server");
    }
  }
}
