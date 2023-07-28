import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/circle_progress_bar.dart';
import 'package:intro_screen_onboarding_flutter/circle_progress_bar.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:path/path.dart';






// class onBoarding extends StatelessWidget {
//   static String id="onBoarding";
  
//   final List<Introduction> list = [
//     Introduction(
//       title: 'Buy from Brands',titleTextStyle: TextStyle(fontSize: 30,color: basiccolor,),
//       subTitle: 'Discover, buy your favorite brands anywhere now',subTitleTextStyle: TextStyle(fontSize: 20,color: basiccolor,),
//       imageUrl: 'images/jackets/onboarding1.jpg',imageHeight: 200,
//     ),
//     Introduction(
//       title: 'Enjoy Shopping',titleTextStyle: TextStyle(fontSize: 30,color: basiccolor,),
//       subTitle: 'Indulge in the latest fashion trends anywhere',subTitleTextStyle: TextStyle(fontSize: 20,color: basiccolor,),
//       imageUrl: 'images/jackets/finish2.jpg',imageHeight: 200,
//     ),
//     Introduction(
//       title: 'Finish',titleTextStyle: TextStyle(fontSize: 30,color: basiccolor,),
//       subTitle: 'get started now and order directly from the application',subTitleTextStyle: TextStyle(fontSize: 20,color: basiccolor,),
//       imageUrl: 'images/jackets/login1.jpg',imageHeight: 200,
//     ),
//   ];

  
//   @override
//   Widget build(BuildContext context) {
//     final w= MediaQuery.of(context as BuildContext).size.width;
//   final h= MediaQuery.of(context as BuildContext).size.height;
//     return IntroScreenOnboarding(
//       introductionList: list,
//     skipTextStyle: TextStyle(fontSize: w*0.06,color: basiccolor),
    
//       backgroudColor: Colors.white,
//       onTapSkipButton: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Login(),
//           ), //MaterialPageRoute
//         );
//       },
//     );
//   }
// }
class onBoarding extends StatefulWidget {
  const onBoarding({Key? key}) : super(key: key);
    static String id="onBoarding";
  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  int currentIndex = 0;
 late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index){
                setState(() {
                  currentIndex = index;
                });
              },
                itemCount: content.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        ClipOval(
                            child: Image.asset(
                          content[index].image,
                          height: 300,
                        )),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          content[index].title,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          content[index].desc,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                List.generate(
                    content.length, (index) => buildDot(index, context))
              ,
            ),
          ),
          Container(
            height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: basiccolor
              ),
               margin: EdgeInsets.all(40),
             width: double.infinity,
            child: MaterialButton(
              child: Text(currentIndex == content.length -1 ? 'Get Started' :'Next',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              onPressed: (){
                if(currentIndex == content.length-1){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => Login()));
                }
                _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              // color: Theme.of(context).primaryColor

            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index,BuildContext context) {
    return Container(
                height: 10,
                width: currentIndex == index ? 25 : 10,
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
              );
  }
}
class OnBoardingModel {
  String image;
  String title;
  String desc;

   OnBoardingModel({required this.image,required this.title, required this.desc});
}


List<OnBoardingModel> content = [
  OnBoardingModel(
      image: 'images/jackets/onboarding1.jpg',
      title: 'Buy from Brands',
      desc: 'Discover, buy your favorite brands anywhere now'),
  OnBoardingModel(
      image: 'images/jackets/finish2.jpg',
      title: 'Enjoy Shopping',
      desc: 'Indulge in the latest fashion trends anywhere '),
  OnBoardingModel(
      image: 'images/jackets/login1.jpg',
      title: 'Finish',
      desc: 'get started now and order directly from the application'),

];