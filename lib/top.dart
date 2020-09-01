import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that
        // was created by the App.build method, and use it to set
        // our appbar title.
        title: new Text(widget.title),
      ),
      body: new Scrollbar(
          child: new ListView(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              children: _libraries.map((library) {
                return new ListTile(
                  isThreeLine: false,
                  dense: false,
                  leading: new CircleAvatar(child: new Image.asset('images/${library.category}.png')),
                  title: new Text(library.formalName),
                  subtitle: new Text(library.address),
                  trailing: new Icon(Icons.info, color: Theme.of(context).disabledColor),
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute<Null>(
                      settings: const RouteSettings(name: "/detail"),
                      builder: (BuildContext context) => new Detail(library)
                    ));
                  },
                );
              }).toList()
          )
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _searchLibraries,
        tooltip: 'Search',
        child: new Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
