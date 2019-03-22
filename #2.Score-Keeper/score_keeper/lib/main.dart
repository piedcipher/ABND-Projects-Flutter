import 'package:flutter/material.dart';

void main() => runApp(Game());

final String appName = "Clash Of Cupheads";

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  BuildContext _context;
  int _cupheadScore = 0;
  int _cupheadHP = 25;
  int _mugmanScore = 0;
  int _mugmanHP = 25;
  Color _cupheadScoreColor = Colors.black;
  Color _cupheadHpColor = Colors.green;
  Color _mugmanScoreColor = Colors.black;
  Color _mugmanHpColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return MaterialApp(
      title: appName,
      color: Colors.yellow[500],
      home: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          backgroundColor: Colors.yellow[500],
          title: Text(
            appName,
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              color: Colors.black,
              onPressed: _resetGame,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Row(
            children: <Widget>[
              playerInformation(playerName: "Cuphead"),
              playerInformation(playerName: "Mugman"),
            ],
          ),
        ),
      ),
    );
  }

  /// Resets score, HP & their colors to initial values
  void _resetGame() {
    setState(() {
      _cupheadScore = _mugmanScore = 0;
      _cupheadHP = _mugmanHP = 25;
      _cupheadScoreColor = _mugmanScoreColor = Colors.black;
      _cupheadHpColor = _mugmanHpColor = Colors.green;
    });
  }

  /// Increments score of Cuphead by 1 & Decrement HP of Mugman by 1 & Highlight colors of Score & HP
  void _cupheadShoot() {
    setState(() {
      _cupheadScore++;
      _mugmanHP--;
      _scoreHighlighter();
      _hpHighlighter(playerName: "Mugman");
    });
  }

  /// Increments score of Cuphead by 2 & Decrement HP of Mugman by 2 & Highlight colors of Score & HP
  void _cupheadExmove() {
    setState(() {
      _cupheadScore += 2;
      _mugmanHP -= 2;
      _scoreHighlighter();
      _hpHighlighter(playerName: "Mugman");
    });
  }

  /// Increments score of Mugman by 1 & Decrement HP of Cuphead by 1 & Highlight colors of Score & HP
  void _mugmanShoot() {
    setState(() {
      _mugmanScore++;
      _cupheadHP--;
      _scoreHighlighter();
      _hpHighlighter(playerName: "Cuphead");
    });
  }

  /// Increments score of Mugman by 1 & Decrement HP of Cuphead by 1 & Highlight colors of Score & HP
  void _mugmanExmove() {
    setState(() {
      _mugmanScore += 2;
      _cupheadHP -= 2;
      _scoreHighlighter();
      _hpHighlighter(playerName: "Cuphead");
    });
  }

  /// Highlights score of leading player with Green and score of lagging player with red otherwise black
  void _scoreHighlighter() {
    if (_cupheadScore > _mugmanScore) {
      _cupheadScoreColor = Colors.green[800];
      _mugmanScoreColor = Colors.red[800];
    } else if (_mugmanScore > _cupheadScore) {
      _mugmanScoreColor = Colors.green[800];
      _cupheadScoreColor = Colors.red[800];
    } else {
      _cupheadScoreColor = _mugmanScoreColor = Colors.black;
    }
  }

  /// Highlights HP (Health-Points) of any player with certain color in when HP in certain range
  void _hpHighlighter({@required String playerName}) {
    if (playerName == "Cuphead") {
      if (_cupheadHP >= 21 && _cupheadHP <= 25) {
        _cupheadHpColor = Colors.green;
      } else if (_cupheadHP >= 16 && _cupheadHP <= 20) {
        _cupheadHpColor = Colors.lightGreen;
      } else if (_cupheadHP >= 11 && _cupheadHP <= 15) {
        _cupheadHpColor = Colors.lime[800];
      } else if (_cupheadHP >= 6 && _cupheadHP <= 10) {
        _cupheadHpColor = Colors.orange;
      } else if (_cupheadHP >= 1 && _cupheadHP <= 5) {
        _cupheadHpColor = Colors.red;
      } else {
        showWinnerDialog(_context, "Mugman");
        _cupheadHpColor = Colors.black;
      }
    } else {
      if (_mugmanHP >= 21 && _mugmanHP <= 25) {
        _mugmanHpColor = Colors.green;
      } else if (_mugmanHP >= 16 && _mugmanHP <= 20) {
        _mugmanHpColor = Colors.lightGreen;
      } else if (_mugmanHP >= 11 && _mugmanHP <= 15) {
        _mugmanHpColor = Colors.lime[800];
      } else if (_mugmanHP >= 6 && _mugmanHP <= 10) {
        _mugmanHpColor = Colors.orange;
      } else if (_mugmanHP >= 1 && _mugmanHP <= 5) {
        _mugmanHpColor = Colors.red;
      } else {
        showWinnerDialog(_context, "Cuphead");
        _mugmanHpColor = Colors.black;
      }
    }
  }

  Widget playerInformation({@required String playerName}) {
    List<Color> colors = [Colors.red[100], Colors.red[400], Colors.red[500]];
    String playerImage = "assets/cuphead_running.png";
    double playerImagePadding = 12;

    if (playerName == "Mugman") {
      colors = [];
      colors.add(Colors.blue[100]);
      colors.add(Colors.blue[400]);
      colors.add(Colors.blue[500]);
      playerImage = "assets/mugman_running.png";
      playerImagePadding = 38;
    }

    return Expanded(
      flex: 1,
      child: Container(
        color: colors[0],
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            // Player Name
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                playerName,
                style: TextStyle(color: colors[2], fontWeight: FontWeight.bold),
              ),
            ),

            // Player Score
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                playerName == "Cuphead"
                    ? _cupheadScore.toString()
                    : _mugmanScore.toString(),
                style: TextStyle(
                    color: playerName == "Cuphead"
                        ? _cupheadScoreColor
                        : _mugmanScoreColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 54),
              ),
            ),

            // Player Image
            SizedBox(
              height: 170,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(playerImagePadding),
                child: Image.asset(playerImage),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "HP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),

            // Player HP
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                playerName == "Cuphead"
                    ? _cupheadHP.toString()
                    : _mugmanHP.toString(),
                style: TextStyle(
                    color: playerName == "Cuphead"
                        ? _cupheadHpColor
                        : _mugmanHpColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 40),
              ),
            ),

            // Player Shoot
            Container(
              margin: EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  splashColor: Colors.white,
                  onPressed:
                      playerName == "Cuphead" ? _cupheadShoot : _mugmanShoot,
                  color: colors[1],
                  child: Text(
                    "Shoot",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            // Player Ex-move
            Container(
              margin: EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  splashColor: Colors.white,
                  onPressed:
                      playerName == "Cuphead" ? _cupheadExmove : _mugmanExmove,
                  color: colors[1],
                  child: Text(
                    "Ex-Move",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows Dialog with name of Winner when either of player's HP reaches 0
  void showWinnerDialog(BuildContext context, String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("$winner Won"),
            ));
  }
}
