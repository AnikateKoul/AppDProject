import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:http/http.dart' as http;





class GoogleSheetsData extends StatefulWidget {
  const GoogleSheetsData({Key? key}) : super(key: key);

  @override
  State<GoogleSheetsData> createState() => _GoogleSheetsDataState();
}

class _GoogleSheetsDataState extends State<GoogleSheetsData> {
  List<int> data_list1 = [];
  List<int> data_list2 = [];
  // List<int> data_list3 = [];
  int avg1 = 0;
  int avg2 = 0;
  // int avg3 = 0;
  Future getSensorData() async{
    http.Response response=await http.get(Uri.parse('https://script.google.com/macros/s/AKfycbzUrr60PADoAsj3Frb6N-_6rhVepfvqMdSKVeFxEv8GcQdIXduzHApQzyVogcqt0B0q-Q/exec'));
    var result=jsonDecode(response.body);
    setState(() {
      for(var i in result){
        data_list1.add(i['GAS']);
        // data_list2.add(i['LIGHT']);
        data_list2.add(i['SOIL_MOISTURE']);
      }
      num total1 = 0;
      data_list1.forEach((item) => total1 += item);
      num total2 = 0;
      data_list2.forEach((item) => total2 += item);
      // num total3 = 0;
      // data_list3.forEach((item) => total3 += item);
      avg1=(total1/data_list1.length).round();
      avg2=(total2/data_list2.length).round();
      // avg3=(total3/data_list3.length).round();
      print("$avg1 $avg2\n");
    });
  }
//   void callAPI() async {
// //     final gSheets = GSheets(_credentials);
// //     final ss = await gSheets.spreadsheet(_spreadsheetID);
// //     var sheet = ss.worksheetByTitle("Worksheet1");
// //     // await sheet!.values.appendRow([50]);
// //     // await sheet!.values.
// //     print((await sheet!.values.lastRow(fromColumn: 1,  inRange: false))!.join("    "));
// // }

  @override
  void initState() {
    getSensorData();
  }

  @override
  Widget build(BuildContext context) {
    // getSensorData();
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('$avg1'),
            Text('$avg2'),
            Row(
              children: [
                TextButton(
                  onPressed: getSensorData,
                  child: const Text("Click to get data"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
