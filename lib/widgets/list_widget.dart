import 'package:flutter_web/material.dart';

class EmmetListWidget extends StatelessWidget {
  final Map listmap;
  EmmetListWidget(this.listmap);

  @override
  Widget build(BuildContext context) {
    return checkEmpty();
  }

  Widget checkEmpty() {
    if (listmap.length == 0) {
      return Center(
        child: Text("No Results Available"),
      );
    } else {
      return ListView.builder(
        itemCount: listmap.length,
        itemBuilder: (BuildContext ctxt, int index) {
          if (listmap.length - 1 == index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 200 ),
              child: _listItem(index),
            );
          } else if(index == 0) {
            return Padding(
              padding: const EdgeInsets.only(top: 10 ),
              child: _listItem(index),
            );
          } else {
            return _listItem(index);
          }
        },
      );
    }
  }

  Widget _listItem(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
      child: ListTile(
        key: Key(listmap.keys.elementAt(index)),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(listmap.keys.elementAt(index)),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(listmap.values.elementAt(index)),
        ),
        contentPadding: EdgeInsets.all(8),
      ),
    );
  }
}
