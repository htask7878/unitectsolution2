import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: home(),
  ));
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  dynamic cat_id, prod_name, prod_mrp, prod_description;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  Color c = Color(0xffe9e9e9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(right: 5, left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Ink(
                  child: Center(
                      child: Text(
                    "ADD PRODUCT",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff4d4d4d),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Text("Select Category : ",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start),
                  height: 20,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 10,
                ),
                ExpansionTile(
                  backgroundColor: c,
                  title: Text("product"),
                  children: [
                    Text("Mango"),
                    Text("Orange"),
                    Text("Banana"),
                    Text("Apple"),
                  ],
                  // title: TextField(
                    //     controller: t1,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //           borderSide: BorderSide.none,
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(5))),
                    //     ))
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: Text("Name ",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start),
                  // height: 20,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 10,
                ),
                Ink(
                    height: 40,
                    color: c,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        controller: t2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ))),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Text("MRP",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start),
                  height: 20,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 10,
                ),
                Ink(
                    height: 40,
                    color: c,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        controller: t2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ))),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Text("Description",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.start),
                  height: 20,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 10,
                ),
                Ink(
                    height: 80,
                    color: c,
                    child: TextField(
                        controller: t3,
                        minLines: 1,
                        maxLines: 10,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ))),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 45),
                        onPrimary: Colors.purpleAccent,
                        primary: Color(0xff4d4d4d)),
                    onPressed: () async {
                      prod_name = t1.text;
                      prod_mrp = t2.text;
                      prod_description = t3.text;
                      print("name = $cat_id");
                      print("type = $prod_name");
                      print("desc = $prod_mrp");
                      print("qty = $prod_description");
                      var url = Uri.parse(
                          'https://pdfile7.000webhostapp.com/getdata2.php?cat_id=1&prod_name=Orange&prod_mrp=100&prod_description=test');
                      var response = await http.get(url);
                      print('Response body: ${response.body}');

                      // Map  m=jsonDecode(response.body);
                      // print(m['cat_type']);
                      // print(m['cat_name']);
                      // print(m['cat_description']);
                      // print(m['cat_qty']);
////////////////////////////////////////////////////////////////
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return second(cat_type,cat_name,cat_description,cat_qty);
                      // },));
                      setState(() {});

                      t1.text = "";
                      t2.text = "";
                      t3.text = "";
                    },
                    child: Text(
                      "submit",
                      style: TextStyle(
                          fontSize: 18, letterSpacing: 1, color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
