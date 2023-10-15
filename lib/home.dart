import 'package:flutter/material.dart';
import 'package:table_for_kids/pages/page_under_development.dart';

import 'model.dart';
import 'pages/table.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List Pages = [
      table(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
      pageUnderDevelopment(),
    ];

    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Kids Learning App",
              style: TextStyle(fontSize: 21),
            ),
            Icon(
              Icons.menu,
              size: 31,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// 1
            Padding(
              padding: EdgeInsets.only(left: 1, right: 1),
              child: Container(
                /// error
                height: size.height / 1.15,
                width: size.width,
                child: ListView.builder(
                  itemCount: list1.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Pages[index],
                              ));
                        },
                        child: Container(
                          height: size.height / 8,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Center(
                            child: Text(
                              list1[index]['name'],
                              style: TextStyle(fontSize: 31),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        return print(index);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
