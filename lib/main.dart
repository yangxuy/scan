import 'package:flutter/material.dart';

import 'utils/scan_utils.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp2();
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp2> with SingleTickerProviderStateMixin {
  String barcode = "";
  TabController tabController;

  @override
  initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: TabBar(
              controller: tabController,
              tabs: [Tab(text: '1111'), Tab(text: '2222'), Tab(text: '3333')],
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          body: new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new MaterialButton(
                      onPressed: scan, child: new Text("Scan")),
                  padding: const EdgeInsets.all(8.0),
                ),
                new Text(barcode),
              ],
            ),
          )),
    );
  }

  Future scan() async {
    var res = await ScanUtils.scan();
    print(res);
  }
}
