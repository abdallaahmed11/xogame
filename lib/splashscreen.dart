import 'package:flutter/material.dart';
import 'package:xogame/core/colors.dart';
import 'xoborad.dart';

class Splashscreen extends StatefulWidget {
  static String routename = 'Splashscreen';

  @override
  State<Splashscreen> createState() => _SplashscreenState();

}

class _SplashscreenState extends State<Splashscreen> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Appcolors.cyan, Appcolors.blue]),
        ),
        child: Column(
          children: [
             Expanded(flex: 7,
                 child: Image.asset("images/xoo.png",width:double.infinity,fit: BoxFit.cover,)),
            Expanded(
              flex: 4,

                child: Column(
                  children: [
                    Text("Pick who goes first?",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Appcolors.white),),
                    SizedBox(height: 30,),

                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,

                        children: [

                        Expanded(

                          child: InkWell(
                      onTap:(){Navigator.pushNamed(context, Gameborad.routename,arguments: 'x');} ,
                            child: Container(
                              margin:EdgeInsets.all(40),
                              decoration: BoxDecoration(color: Appcolors.white,borderRadius: BorderRadius.circular(30)),
                              child: Center(child: Text('x',style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold,color: Colors.red),)),),
                          ),
                        ),
                        SizedBox(width: 1,),
                        Expanded(

                          child: InkWell(
                            onTap: (){Navigator.pushNamed(context, Gameborad.routename,arguments: 'o');},
                            child: Container(
                              margin:EdgeInsets.all(40),

                              decoration: BoxDecoration(color: Appcolors.white,borderRadius: BorderRadius.circular(30)),
                              child: Center(child: Text('o',style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold,color: Colors.green),)),),
                          ),
                        ),


                        ],),
                    ),
                    SizedBox(height: 15),

                  ],

                )),


          ],
        ),
      ),
    );
  }
}
