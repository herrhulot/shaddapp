import 'package:flutter/material.dart';

class YourHomePage extends StatefulWidget {
  @override
  _YourHomePageState createState() => _YourHomePageState();
}

class _YourHomePageState extends State<YourHomePage> {
  Color _circleColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(42.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: this._circleColor, shape: BoxShape.circle),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      _playSound(3);
                    },
                    customBorder: CircleBorder(),
                    child: Center(
                      child: Text(
                        "Shaddapp",
                        style: Theme.of(context).textTheme.headline.apply(
                          color: Colors.white,
                          fontSizeFactor: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _playSound(int urtan) {
    setState(() {
      if (this._circleColor == Colors.red) {
        this._circleColor = Colors.blue;
        this._circleColor = Colors.blue;
      } else {
        this._circleColor = Colors.red;
      }
    });
    print(urtan);
  }
}
