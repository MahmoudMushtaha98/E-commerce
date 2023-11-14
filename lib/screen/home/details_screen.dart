import 'package:evgo/screen/home/home_screen.dart';
import 'package:evgo/widget/button_widget.dart';
import 'package:flutter/material.dart';

import '../../widget/color_widget.dart';
import '../../widget/details_widget.dart';

class DetailsScreen extends StatelessWidget {
   DetailsScreen({Key? key}) : super(key: key);

  static const screenRoute = '/details-screen';


  List<DetailsWidget> details = [
    const DetailsWidget(path: 'assets/images/ps4_console_white_1.png',),
    const DetailsWidget(path: 'assets/images/ps4_console_white_2.png',),
    const DetailsWidget(path: 'assets/images/ps4_console_white_3.png',),
    const DetailsWidget(path: 'assets/images/ps4_console_white_4.png',),
  ];

  List<ColorWidget> colors = [
    const ColorWidget(color: Colors.red,),
    const ColorWidget(color: Colors.purple,),
    const ColorWidget(color: Colors.brown,),
    const ColorWidget(color: Colors.white,),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: widthOrHeight(context,choice:0)*0.03,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(widthOrHeight(context,choice:0)*0.07),
            child: Image.asset('assets/images/Image Popular Product 1.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(

                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: widthOrHeight(context,choice:1)*0.06),
                      width: widthOrHeight(context,choice:1)*0.12,
                      height: widthOrHeight(context,choice:1)*0.12,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: const Icon(Icons.arrow_back_ios_sharp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: widthOrHeight(context,choice:1)*0.06),
                    width: widthOrHeight(context,choice:1)*0.17,
                    height: widthOrHeight(context,choice:1)*0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('4.8',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        setIcon('assets/icons/Star Icon.svg',)
                      ],
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(details.length, (index) {
                      return Row(
                        children: [
                          details[index],
                          SizedBox(width: widthOrHeight(context,choice:1)*0.03,)
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: widthOrHeight(context,choice:0)*0.02,),
                  Container(
                    width: double.infinity,
                    height: widthOrHeight(context,choice:0)*0.48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(widthOrHeight(context,choice:0)*0.06),topLeft: Radius.circular(widthOrHeight(context,choice:0)*0.06)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: widthOrHeight(context,choice:1)*0.07,top: widthOrHeight(context,choice:1)*0.07),
                          child: Text('Wireless Controller for PS4™',style: TextStyle(fontFamily: 'MyFont',fontSize: widthOrHeight(context,choice:1)*0.05),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: widthOrHeight(context,choice:1)*0.18,
                              height: widthOrHeight(context,choice:0)*0.07,
                              decoration:  BoxDecoration(
                                color: Colors.pink.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                              ),
                              child: const Icon(Icons.favorite,color: Colors.red,),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(widthOrHeight(context,choice:1)*0.07, 0, 0, 0),
                          width: widthOrHeight(context,choice:1)*0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Wireless Controller for PS4™ gives you what '
                                  'you want in your gaming from over precision control'
                                  ' your games to sharing',
                                style: TextStyle(color: Colors.grey,fontFamily: 'MyFont'),
                                maxLines: 3,
                                overflow:  TextOverflow.ellipsis,
                              ),
                              SizedBox(height: widthOrHeight(context,choice:0)*0.01,),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {

                                    },
                                      child: const Text('See More Detail ',style: TextStyle(color: Colors.deepOrange,fontFamily: 'MyFont',fontWeight: FontWeight.bold),)),
                                  Icon(Icons.arrow_forward_ios,size: widthOrHeight(context,choice:0)*0.015,color: Colors.deepOrange,)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(widthOrHeight(context,choice:1)*0.05),
                alignment: Alignment.topLeft,
                width: double.infinity,
                height: widthOrHeight(context,choice:0)*0.18,
                decoration: const BoxDecoration(
                  color: Color(0xFFf6f7f9),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: List.generate(colors.length, (index) {
                        return Row(
                          children: [
                            colors[index],
                            const SizedBox(width: 5,)
                          ],
                        );
                      },)
                    ),
                    buildContainer(widthOrHeight(context,choice:1),Icons.remove),
                    buildContainer(widthOrHeight(context,choice:1),Icons.add),
                  ],
                ),
              )
            ],
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: widthOrHeight(context,choice:0)*0.09,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(text: 'Add To Cart',width: widthOrHeight(context,choice:1),callBack: () {

                    },),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildContainer(double width,IconData icon) {
    return Container(
                    alignment: Alignment.center,

                    width: width*0.1,
                    height: width*0.1,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Icon(icon,color: Colors.deepOrange,),
                  );
  }
}

//f6f7f9