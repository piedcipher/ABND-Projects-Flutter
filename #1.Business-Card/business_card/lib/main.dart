import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pied Piper",
      color: Colors.green[800],
      home: Scaffold(
        body: Container(
          color: Colors.green[800],
          child: ListView(
            children: <Widget>[
              Image.asset("assets/piedpiper_header.png"),
              Center(
                child: Container(
                  margin: EdgeInsets.all(18),
                  child: Text(
                    "Go Small or Go Home",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Text(
                    "A Middle-out Compression Solution to make Data Storage Problems smaller. We take compression to a new level with Weissman Score of 5.2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Container(
                    height: 1,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.public,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "piedpiper.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "5230 Penfield Ave, Woodland Hills, CA",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}