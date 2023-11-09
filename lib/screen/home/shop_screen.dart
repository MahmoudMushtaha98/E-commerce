import 'package:evgo/screen/home/shop_screen.dart';
import 'package:evgo/widget/card_icon.dart';
import 'package:evgo/widget/popular_widget.dart';
import 'package:evgo/widget/special_for_you.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShopScreen extends StatelessWidget {
   const ShopScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<CardOfIcon> list = [
      CardOfIcon(width: width, path: 'assets/icons/Flash Icon.svg', textOfCard: 'Flash Deal'),
      CardOfIcon(width: width, path: 'assets/icons/Bill Icon.svg', textOfCard: 'Bill'),
      CardOfIcon(width: width, path: 'assets/icons/Game Icon.svg', textOfCard: 'Game'),
      CardOfIcon(width: width, path: 'assets/icons/Gift Icon.svg', textOfCard: 'Daily Gift'),
      CardOfIcon(width: width, path: 'assets/icons/Discover.svg', textOfCard: 'More'),

    ];

    List<SpecialForYou> specialForYou = [
      SpecialForYou(width: width, height: height,path: 'assets/images/Image Banner 2.png',title: 'Smartphone',subTitle: '18 Brands',),
      SpecialForYou(width: width, height: height,path: 'assets/images/Image Banner 3.png',title: 'Fashion',subTitle: '24 Brands',),
    ];

    List<PopularProduct> popular = [
      PopularProduct(
        width: width,
        path: 'assets/images/Image Popular Product 1.png',
        title: 'Wireless Controller for PS4™',
        price: "\$64.99",
      ),
      PopularProduct(
        width: width,
        path: 'assets/images/Image Popular Product 2.png',
        title: 'Nike Sport White - Man Paint',
        price: "\$50.5",
      ),
      PopularProduct(
        width: width,
        path: 'assets/images/Image Popular Product 3.png',
        title: 'Wireless Controller for PS4™',
        price: "\$64.99",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        toolbarHeight: 20,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: width*0.03),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width*0.6,
                  height: height*0.07,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      prefixIcon: Icon(Icons.search),
                      label: Text('Search product',style: TextStyle(fontSize: 15,fontFamily: 'MyFont'),),
                      contentPadding: EdgeInsets.only(left: 30,top: 40),
                    ),
                  ),
                ),
                buildCircleContainer(width, height,'assets/icons/Cart Icon.svg'),
                buildCircleContainer(width, height,'assets/icons/Bell.svg'),
              ],
            ),
             SizedBox(height: height*0.02,),
             Container(
               alignment: Alignment.topLeft,
               padding: EdgeInsets.all(width*0.05),
               decoration: const BoxDecoration(
                 color: Colors.deepPurple,
                 borderRadius: BorderRadius.all(Radius.circular(15))
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('A Summer Surpise',style: TextStyle(fontFamily: 'MyFont',color: Colors.white,fontSize:width*0.04 )),
                   Text('Cashback 20%',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'MyFont',fontSize:width*0.07,color: Colors.white)),
                 ],
               ),
             ),
            SizedBox(height: height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: list,
            ),
            SizedBox(height: height*0.02,),
              buildRow(width,'Special for you','See more'),
            SizedBox(height: height*0.02,),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(specialForYou.length, (index) {
                  return Row(
                    children: [
                      specialForYou[index],
                      SizedBox(width: width*0.06,)
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: height*0.02,),
            buildRow(width,'Popular Products','See more'),
            SizedBox(height: height*0.02,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(popular.length, (index) {
                  return popular[index];
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRow(double width,String title,String subTitle) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text(title,style: TextStyle(fontSize: width*0.06,fontFamily: 'MyFont'),),
                Text(subTitle,style: const TextStyle(color: Colors.grey,fontFamily: 'MyFont')),

              ],
           );
  }






  Container buildCircleContainer(double width, double height,String path) {
    return Container(
              padding:  EdgeInsets.all(width*0.035),
              height: height*0.07,
              width: width*0.14,
              decoration: const BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.circle,
              ),
              child: SizedBox(child: setIcon(path)),
            );
  }
}

Widget setIcon(String path){
  return SvgPicture.asset(
      path,
      semanticsLabel: 'Acme Logo',

  );
}