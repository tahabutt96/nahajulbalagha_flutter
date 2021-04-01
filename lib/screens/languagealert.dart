import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';

class LanguageAlert extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguageAlertState();
}

class LanguageAlertState extends State<LanguageAlert>
    with SingleTickerProviderStateMixin {
  bool status = false;
  bool statuslan = false;
  bool statusnoti = false;

  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 330,
            decoration: ShapeDecoration(
                color: primary_background,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        "Change Language",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 30)
                      ),
                    ),
                    Text("If you want to change language you can change it now.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline4
                            .copyWith(fontSize: 20)),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomSwitch(
                            activeColor: Colors.orangeAccent,
                            value: Theme.of(context).brightness ==
                                Brightness.dark,
                            onChanged: (value) {
                              print("VALUE : $value");
                              setState(() {
                                // currentTheme.toggleTheme();
                                // status = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: GestureDetector(
                        onTap: (){ Navigator.pop(context);},
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:5.0),
                                child: Icon(Icons.cancel_outlined,color: Colors.white,),
                              ),
                              Text(
                                "Close",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Loto-Regular'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}