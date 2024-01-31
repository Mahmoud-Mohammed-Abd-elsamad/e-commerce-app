import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ApiManger {
  static Future<DataModelProduct> getData() async {
    Uri url = Uri.parse("https://student.valuxapps.com/api/products");
    var response = await http.get(url);
    print(response.body);
    var json = jsonDecode(response.body);
    //var liat = ;

    var data = DataModelProduct.fromJson(json);
   /// data.data!.dataM!.length;
    print("${data.data!.dataM}>>>>>>>>>>>>>>>>>>>>>>");

    return data;
  }
}
