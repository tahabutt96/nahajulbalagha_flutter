import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/constants/constant_text.dart';
import 'package:nahjul_balagha/screens/hikmatlist.dart';
import 'package:nahjul_balagha/screens/favourites.dart';
import 'package:nahjul_balagha/screens/khutbalist.dart';
import 'package:nahjul_balagha/screens/maktooblist.dart';
import 'package:nahjul_balagha/widgets/aboutus.dart';
import 'package:nahjul_balagha/widgets/bottomnavigation.dart';
import 'package:nahjul_balagha/widgets/homebottomnav.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Confirm'),
              content: Text('Do you want to exit the App'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false); //Will not exit the App
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    SystemNavigator.pop(); //Will exit the App
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel", style: TextStyle(fontFamily: 'Lato-Bold')),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Purchase", style: TextStyle(fontFamily: 'Lato-Bold')),
      onPressed: () {
        SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("In App Purchase", style: TextStyle(fontFamily: 'Lato-Bold')),
      content: Text("Purchase now to enjoy ads free version.",
          style: TextStyle(fontFamily: 'Lato-Regular')),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String text =
      'Hi, I have found beautiful Islamic App Nahajul Balagha on both Play store and App store. Download now by following this link https://play.google.com/store/apps/';
  String subject = 'Nahaj ul Balaga';
  BannerAd myBanner;
  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner..show();
          }
        });
  }

  BannerAd buildLargeBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.largeBanner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner
              ..show(
                  anchorType: AnchorType.top,
                  anchorOffset: MediaQuery.of(context).size.height * 0.15);
          }
        });
  }

  @override
  void initState() {
    super.initState();

    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    myBanner = buildBannerAd()..load();
    //myBanner = buildLargeBannerAd()..load();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: primary_text,
          backgroundColor: primary_background,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => favourites()));
              },
            )
          ],
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: Container(
                    child: Text(
                      "Nahjul Balagha",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'Lato-Bold'),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: primary_background,
                ),
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(
                  'About Us',
                  style: TextStyle(fontFamily: 'Lato-Bold'),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => aboutus()));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.more_horiz_sharp),
                title: Text('More Apps',
                    style: TextStyle(fontFamily: 'Lato-Bold')),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  _launchURL("https://play.google.com/store/apps/");
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => moreapps()));
                },
              ),
              // Divider(),
              // ListTile(
              //   leading: Icon(Icons.monetization_on_outlined),
              //   title: Text('In app Purchase',style: TextStyle(fontFamily: 'Lato-Bold')),
              //   onTap: () {
              //     // Update the state of the app.
              //     // ...
              //     showAlertDialog(context);
              //     //Navigator.push(context, MaterialPageRoute(builder: (context) => inapppurchase()));
              //   },
              // ),
              Divider(),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share', style: TextStyle(fontFamily: 'Lato-Bold')),
                onTap: () {
                  final RenderBox box = context.findRenderObject();
                  Share.share(text,
                      subject: subject,
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.policy_outlined),
                title: Text('Privacy Policy',
                    style: TextStyle(fontFamily: 'Lato-Bold')),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  _launchURL("https://mavrixsol.wixsite.com/privacypolicy");
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => rateus()));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.rate_review_outlined),
                title:
                    Text('Rate Us', style: TextStyle(fontFamily: 'Lato-Bold')),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  _launchURL("https://play.google.com/store/apps/");
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => rateus()));
                },
              ),
              Divider(),
            ],
          ),
        ),
        body: Container(
            margin: const EdgeInsets.only(bottom: 50), child: homebottomnav()),
      ),
    );
  }
}
