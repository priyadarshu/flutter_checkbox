import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = ['List1', 'List2', 'List3'];
  int indexVal = 0;
  //Map<String, bool> mapitems={items : true};
  List checkeditems = [];
  bool checkboxValue = true;
  Future<dynamic> onClicked(bool value, index) async {
    await index;
    try {
      setState(() {
        if (value) {
          if (checkeditems.contains(items[index])) {
            print("Item already exists, hence skipped!");
          } else {
            checkeditems.add(items[index]);
          }
        } else {
          if (checkeditems.contains(items[index])) {
            checkeditems.remove(items[index]);
          }
        }
      });
    } catch (e) {
      print("Error is" + e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                // key: key,
                onTap: () {},
                leading: Text(
                  (index + 1).toString(),
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                ),
                title: Text(
                  "Crate" +
                      " - " +
                      (index + 1).toString() +
                      " - " +
                      items[index],
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                ),
                trailing: Checkbox(
                  value: checkboxValue,
                  activeColor: Colors.green,
                  onChanged: (bool value) {
                    checkboxValue = value;
                    onClicked(value, index);
                  },
                  checkColor: Colors.black54,
                ),
              );
            },
          ),
          Text("Items are " + checkeditems.toString()),
          SizedBox(height: 20.0),
          Text("Count of Checked Items are" + checkeditems.length.toString()),
          SizedBox(height: 20.0),
          Text("Total no of items :" + items.length.toString()),
        ],
      ),
    );
  }
}
