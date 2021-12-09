import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class DartGame extends StatefulWidget {
  @override
  _DartGame createState() {
    return _DartGame();
  }
}

class _DartGame extends State<DartGame> {
  double dartX = 0;
  double dartY = 1;
  double sizeW = 120.0;
  double sizeH = 120.0;
  double ra = 0;
  double dartRanX = pow(-1, Random().nextInt(10)) * Random().nextDouble();
  double dartRanY = -Random().nextDouble();
  int index = 1;
  int achko = 0;

  void otish() {
    Timer.periodic(const Duration(microseconds: 10), (timer) {
      setState(() {
        // index++;
        // dartY -= 0.005;
        // dartX -= (dartX-dartRanX)/100;
        // if(index == 3){
        //    index = 1;
        // }
        dartX = dartRanX;
        dartY = dartRanY;
      });
      // dartX = dartRanX;
      // if(dartY <= dartRanY ){
      //   timer.cancel();
      // }
    });
    ra = sqrt(pow(((-0.4) - (dartRanY)), 2) + pow(((-0.06) - (dartRanX)), 2));
    if (ra <= 0.085) {
      achko = 10;
    } else if (ra > 0.085 && ra <= 0.17) {
      achko = 8;
    } else if (ra > 0.17 && ra <= 0.27) {
      achko = 6;
    } else if (ra > 0.27 && ra <= 0.38) {
      achko = 4;
    } else if (ra > 0.38 && ra <= 0.48) {
      achko = 2;
    } else if (ra > 0.48 && ra <= 0.69) {
      achko = 1;
    } else {


      achko = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: otish,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter B1$achko'),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Stack(
              children: [
                Container(
                  child: Text('salom$ra'),
                ),
                Container(
                  alignment: const Alignment(0, -1.4),
                  child: Row(
                    children: [
                      Container(
                        child: const Image(
                          image: AssetImage('images/359.png'),
                        ),
                        width: 370,
                        height: 370,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment(-0.1, -0.36),
                  child: Container(
                    child: Image(
                      image: AssetImage('images/dart$index.png'),
                    ),
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
