import 'package:flutter/material.dart';
import 'package:table_for_kids/model.dart';

class table extends StatefulWidget {
  const table({super.key});

  @override
  State<table> createState() => _tableState();
}

class _tableState extends State<table> {
  var fontsize = 12;
  int chooseTable = 0;
  List<int> tableindex = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Divider(
                color: Colors.black,
                thickness: 5,
              ),

              /// table selection
              Container(
                height: 50,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listTable.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    mainAxisExtent: 100,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          chooseTable = (index + 1);
                          tableindex.clear();
                        });
                      },
                      child: Container(
                        child: Center(child: Text(listTable[index]['table'])),
                        // height: 50,
                        // width: 50,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(31),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(color: Colors.black, thickness: 5),

              /// table name
              Container(
                color: Colors.lightBlueAccent,
                height: 20,
                width: double.infinity,
                child: Center(
                    child: Text(
                  "Table".toUpperCase(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
              ),
              Divider(color: Colors.black, thickness: 5),

              /// table view
              Expanded(
                child: chooseTable == 0
                    ? Container(
                        child: Center(
                            child: Text(
                          "Select Table Number",
                          style: TextStyle(
                              fontSize: 31, fontWeight: FontWeight.bold),
                        )),
                      )
                    : Container(
                        // color: Colors.blueGrey,
                        height: 570,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 100),
                              child: ListTile(
                                onTap: () {
                                  setState(() {
                                    tableindex.contains(index)
                                        ? tableindex.remove(index) // print("duplicate")
                                        : tableindex.add(index);
                                    // print(tableindex);
                                  });
                                },
                                title: tableindex.contains(index)
                                    ? buildCard2(index)
                                    : buildCard1(index),
                              ),
                            );
                          },
                        ),
                      ),
              ),
              Divider(thickness: 5, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard1(int index) {
    return Card(
      margin: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            chooseTable.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
          Text(
            "*",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
          Text(
            "${index + 1}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
          Text(
            "=",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
          Text(
            "?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ],
      ),
    );
  }

  Card buildCard2(int index) {
    return Card(
      color: Colors.green,
      margin: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            chooseTable.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "*",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "${index + 1}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "=",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "${chooseTable * (index + 1)}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
