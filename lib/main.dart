import 'package:flutter_web/material.dart';
import 'package:web_test/widgets/list_widget.dart';

import 'data/emmet_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget appBarTitle = Text("Emmet Cheatsheet Demo (Build with flutter for web)");
  Icon appBarIcon = Icon(Icons.search);
  Map _htmlMap = Map.from(html);
  Map _cssMap = Map.from(css);
  Map _svgMap = Map.from(svg);
  Map _xslMap = Map.from(xsl);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: appBarTitle,
          actions: <Widget>[
            IconButton(
              icon: appBarIcon,
              onPressed: () {
                setState(() {
                  if (this.appBarIcon.icon == Icons.search) {
                    this.appBarIcon = Icon(Icons.close);
                    this.appBarTitle = TextField(
                      style: new TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white70,
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          )),
                      onChanged: (searchText) => filterResults(searchText),
                    );
                  } else {
                    this.appBarIcon = Icon(Icons.search);
                    this.appBarTitle = Text("Emmet Cheatsheet Demo (Build with flutter for web)");
                    filterResults("");
                  }
                });
              },
            )
          ],
          bottom: TabBar(            
            tabs: <Widget>[
              Tab(
                text: "HTML",
              ),
              Tab(
                text: "CSS",
              ),
              Tab(
                text: "SVG",
              ),
              Tab(
                text: "XSL",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            EmmetListWidget(_htmlMap),
            EmmetListWidget(_cssMap),
            EmmetListWidget(_svgMap),
            EmmetListWidget(_xslMap),
          ],
        ),
      ),
      length: 4,
    );
  }

  void filterResults(searchText) {
    searchText = searchText.toString().toLowerCase();
    setState(() {
      _htmlMap.clear();
      _cssMap.clear();
      _xslMap.clear();
      _svgMap.clear();
    });

    html.forEach((key, value) {
      setState(() {
        if (key.toLowerCase().contains(searchText) ||
            value.toLowerCase().contains(searchText)) {
          _htmlMap.putIfAbsent(key, () => value);
        }
      });
    });

    css.forEach((key, value) {
      setState(() {
        if (key.toLowerCase().contains(searchText) ||
            value.toLowerCase().contains(searchText)) {
          _cssMap.putIfAbsent(key, () => value);
        }
      });
    });

    xsl.forEach((key, value) {
      setState(() {
        if (key.toLowerCase().contains(searchText) ||
            value.toLowerCase().contains(searchText)) {
          _xslMap.putIfAbsent(key, () => value);
        }
      });
    });

    svg.forEach((key, value) {
      setState(() {
        if (key.toLowerCase().contains(searchText) ||
            value.toLowerCase().contains(searchText)) {
          _svgMap.putIfAbsent(key, () => value);
        }
      });
    });
  }
}
