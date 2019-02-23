import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String _busniessUrl = "http://www.piedpiper.com";
  final String _businessLocation = "https://goo.gl/maps/Lnh3S5x82VG2";

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
              aboutBusiness(
                  text: "Go Small or Go Home",
                  textSize: 24,
                  fontWeight: FontWeight.bold),
              aboutBusiness(
                  text:
                      "A Middle-out Compression Solution to make Data Storage Problems smaller. We take compression to a new level with Weissman Score of 5.2",
                  textSize: 20,
                  fontStyle: FontStyle.italic),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              contactBusiness(
                  text: "piedpiper.com", url: _busniessUrl, icon: Icons.public),
              contactBusiness(
                  text: "5230 Penfield Ave, Woodland Hills, CA",
                  url: _businessLocation,
                  icon: Icons.location_on),
            ],
          ),
        ),
      ),
    );
  }

  Widget aboutBusiness(
      {@required String text,
      @required double textSize,
      FontWeight fontWeight,
      FontStyle fontStyle}) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: textSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget contactBusiness(
      {@required String text, @required String url, @required IconData icon}) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        onTap: () => launchUrl(url),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
    );
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Can\'t launch $url';
    }
  }
}
