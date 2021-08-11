import 'package:flutter/material.dart';
import 'package:flutter_Onboarding/homepage.dart';
import 'package:transformer_page_view/parallax.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class OnBoardHome extends StatefulWidget {
  static const routename = '/onboarding';
  @override
  _OnBoardHomeState createState() => _OnBoardHomeState();
}
//this is onboarding with the page transform builder....
//Since we re using only templetes here we don't have much freedom with what we are doing???
class _OnBoardHomeState extends State<OnBoardHome> {
  int _slideIndex = 0;

  final List<String> images = [
    "assets/slide_1.png",
    "assets/slide_2.png",
    "assets/slide_3.png",
    "assets/slide_4.png"
  ];

  final List<String> text0 = [
    "Welcome in your app",
    "Enjoy teaching...",
    "Showcase your skills",
    "Friendship is great"
  ];

  final List<String> text1 = [
    "App for food lovers, satisfy your taste",
    "Find best meals in your area, simply",
    "Have fun while eating your relatives and more",
    "Meet new friends from all over the world"
  ];

  final IndexController controller = IndexController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TransformerPageView transformerPageView = TransformerPageView(
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            this._slideIndex = index;
          });
        },
        loop: false,
        controller: controller,
        transformer: new PageTransformerBuilder(
            builder: (Widget child, TransformInfo info) {
          return new Material(
            color: Colors.white,
            elevation: 8.0,
            textStyle: new TextStyle(color: Colors.white),
            borderRadius: new BorderRadius.circular(12.0),
            child: new Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new ParallaxContainer(
                      child: new Text(
                        text0[info.index],
                        style: new TextStyle(
                            color: Colors.pink[200],
                            fontSize: 34.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                      position: info.position,
                      opacityFactor: .8,
                      translationFactor: 400.0,
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    new ParallaxContainer(
                      child: new Image.asset(
                        images[info.index],
                        fit: BoxFit.contain,
                        height: 350,
                      ),
                      position: info.position,
                      translationFactor: 400.0,
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    new ParallaxContainer(
                      child: new Text(
                        text1[info.index],
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color: Colors.pink[100],
                            fontSize: 28.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                      position: info.position,
                      translationFactor: 300.0,
                    ),
                    SizedBox(
                      height: 55.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        itemCount: 4);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: height,
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              transformerPageView,
              if (_slideIndex == 3)
                Positioned(
                  bottom: 10,
                  child: SizedBox(
                    height: 50,
                    width: width * 0.8,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.red[300],
                      child: Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(MyHomePage.routename);
                      },
                    ),
                  ),
                )
            ],
          )),
    );
  }
}
