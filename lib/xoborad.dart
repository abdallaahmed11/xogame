import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xogame/core/colors.dart';
import 'xobutton.dart';

class Gameborad extends StatefulWidget {
  static String routename = 'Gamebord';

  @override
  State<Gameborad> createState() => _GameboradState();
}

class _GameboradState extends State<Gameborad> {
  String playerturn = 'o';
   late Timer timer;
   @override
   @override
   void initState() {
     super.initState();
     Future.delayed(Duration.zero, () {
       final args = ModalRoute.of(context)!.settings.arguments as String?;
       if (args != null) {
         playerturn = args;
         playernumber = playerturn == 'o' ? '1' : '2';
       }
       starttimer();
       setState(() {});
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Appcolors.cyan, Appcolors.blue])),
        child: SafeArea(
          child: Column(
            children: [
              buildstopwatch(),
              buildplayerturn(),
              buildborad(),
              buildresetbutton(),
            ],
          ),
        ),
      ),
    );
  }

  List<String> borad = ['', '', '', '', '', '', '', '', ''];
  String playernumber = '1';
  String iswinner = 'Turn';
  int drawcounter = 0;

  void OnUserclick(int index) {
    if (borad[index].isNotEmpty || checkwinner()) return;

    borad[index] = playerturn;
    if (checkwinner()) {
      iswinner = 'wins';
      timer.cancel();
      setState(() {});
      return;
    }

    drawcounter++;
    if (drawcounter == 9) {
      iswinner = 'Draw';
      timer.cancel(); //
      setState(() {});
      return;
    }

    playerturn = playerturn == 'o' ? 'x' : 'o';
    playernumber = playerturn == 'o' ? '1' : '2';
    setState(() {});
  }


  bool checkwinner() {
    //rows
    if (borad[0] == playerturn &&
        borad[1] == playerturn &&
        borad[2] == playerturn) return true;
    if (borad[3] == playerturn &&
        borad[4] == playerturn &&
        borad[5] == playerturn) return true;
    if (borad[6] == playerturn &&
        borad[7] == playerturn &&
        borad[8] == playerturn) return true;
    //coulmns
    if (borad[0] == playerturn &&
        borad[3] == playerturn &&
        borad[6] == playerturn) return true;
    if (borad[1] == playerturn &&
        borad[4] == playerturn &&
        borad[7] == playerturn) return true;
    if (borad[2] == playerturn &&
        borad[5] == playerturn &&
        borad[8] == playerturn) return true;
    //diagonals
    if (borad[0] == playerturn &&
        borad[4] == playerturn &&
        borad[8] == playerturn) return true;
    if (borad[2] == playerturn &&
        borad[4] == playerturn &&
        borad[6] == playerturn) return true;

    else return false;
  }
void starttimer(){
     timer=Timer.periodic(Duration(seconds: 1

    ), (timer){
       setState(() {

       });
     });
}
  Widget buildborad() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
            color: Appcolors.white, borderRadius: BorderRadius.circular(44)),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Stack(
            children: [
              buildbutton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  VerticalDivider(
                    thickness: 1,
                    color: Appcolors.black,
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: Appcolors.black,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Divider(
                    thickness: 1,
                    color: Appcolors.black,
                  ),
                  Divider(
                    thickness: 1,
                    color: Appcolors.black,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildbutton() {
    return Container(
      decoration: BoxDecoration(
          color: Appcolors.white, borderRadius: BorderRadius.circular(44)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                xobutton(
                  symbol: borad[0],
                  onclick: OnUserclick,
                  index: 0,
                ),
                xobutton(
                  symbol: borad[1],
                  onclick: OnUserclick,
                  index: 1,
                ),
                xobutton(
                  symbol: borad[2],
                  onclick: OnUserclick,
                  index: 2,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                xobutton(
                  symbol: borad[3],
                  onclick: OnUserclick,
                  index: 3,
                ),
                xobutton(
                  symbol: borad[4],
                  onclick: OnUserclick,
                  index: 4,
                ),
                xobutton(
                  symbol: borad[5],
                  onclick: OnUserclick,
                  index: 5,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                xobutton(
                  symbol: borad[6],
                  onclick: OnUserclick,
                  index: 6,
                ),
                xobutton(
                  symbol: borad[7],
                  onclick: OnUserclick,
                  index: 7,
                ),
                xobutton(
                  symbol: borad[8],
                  onclick: OnUserclick,
                  index: 8,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildplayerturn() {

    return Container(
      child: Text(
       drawcounter==9?'Draw':'Player ${playernumber}’s ${iswinner}',
        style: TextStyle(
          color: Appcolors.white,
          fontSize: 36,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildstopwatch() {
    int seconds=timer.tick;
    int hours=seconds~/3600;
    seconds-=hours*3600;
    int minutes=seconds~/60;
    seconds-=minutes*60;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16),
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44), color: Appcolors.white),
      child: Text(
       '${hours<10?'0$hours':hours}:${minutes<10?'0$minutes':minutes}:${seconds<10?'0$seconds':seconds}',
        style: TextStyle(
            color: Appcolors.black, fontSize: 32, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );

  }
  buildresetbutton() {
    return ElevatedButton(
      onPressed: () {
        borad = ['', '', '', '', '', '', '', '', ''];
        playerturn = 'o';
        playernumber = '1';
        iswinner = 'Turn';
        drawcounter = 0;
        starttimer(); // إعادة تشغيل العداد
        setState(() {});
      },
      child: Text('Reset'),
    );
  }

}

