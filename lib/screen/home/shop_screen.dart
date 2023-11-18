import 'package:evgo/model/popular_model.dart';
import 'package:evgo/widget/card_icon.dart';
import 'package:evgo/widget/popular_widget.dart';
import 'package:evgo/widget/special_for_you.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../sign_up/complete_profile.dart';

class ShopScreen extends StatelessWidget {
   const ShopScreen({Key? key}) : super(key: key);

   static const screenRoute = '/shop-screen';

  @override
  Widget build(BuildContext context) {

    List<CardOfIcon> list = [
      CardOfIcon(width: widthOrHeight(context,choice:1), path: 'assets/icons/Flash Icon.svg', textOfCard: 'Flash Deal'),
      CardOfIcon(width: widthOrHeight(context,choice:1), path: 'assets/icons/Bill Icon.svg', textOfCard: 'Bill'),
      CardOfIcon(width: widthOrHeight(context,choice:1), path: 'assets/icons/Game Icon.svg', textOfCard: 'Game'),
      CardOfIcon(width: widthOrHeight(context,choice:1), path: 'assets/icons/Gift Icon.svg', textOfCard: 'Daily Gift'),
      CardOfIcon(width: widthOrHeight(context,choice:1), path: 'assets/icons/Discover.svg', textOfCard: 'More'),

    ];

    List<SpecialForYou> specialForYou = [
      SpecialForYou(width: widthOrHeight(context,choice:1), height: widthOrHeight(context,choice:0),path: 'assets/images/Image Banner 2.png',title: 'Smartphone',subTitle: '18 Brands',),
      SpecialForYou(width: widthOrHeight(context,choice:1), height: widthOrHeight(context,choice:0),path: 'assets/images/Image Banner 3.png',title: 'Fashion',subTitle: '24 Brands',),
    ];

    List<PopularProduct> popular = [
      PopularProduct(
        width: widthOrHeight(context,choice:1),
        popularModel: PopularModel(
          path: 'assets/images/Image Popular Product 1.png',
          title: 'Wireless Controller for PS4™',
          price: "\$64.99"
        ),
      ),
      PopularProduct(
        width: widthOrHeight(context,choice:1),
        popularModel: PopularModel(
          path: 'assets/images/Image Popular Product 2.png',
          title: 'Nike Sport White - Man Paint',
          price: "\$50.5",
        ),
      ),
      PopularProduct(
        width: widthOrHeight(context,choice:1),
        popularModel: PopularModel(
          path: 'assets/images/Image Popular Product 3.png',
          title: 'Wireless Controller for PS4™',
          price: "\$64.99",
        ),
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
        padding: EdgeInsets.symmetric(horizontal: widthOrHeight(context,choice:1)*0.03,vertical: widthOrHeight(context,choice:1)*0.03),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: widthOrHeight(context,choice:1)*0.6,
                  height: widthOrHeight(context,choice:0)*0.07,
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
                buildCircleContainer(widthOrHeight(context,choice:1), widthOrHeight(context,choice:0),'assets/icons/Cart Icon.svg'),
                buildCircleContainer(widthOrHeight(context,choice:1), widthOrHeight(context,choice:0),'assets/icons/Bell.svg'),
              ],
            ),
             SizedBox(height: widthOrHeight(context,choice:0)*0.02,),
             Container(
               alignment: Alignment.topLeft,
               padding: EdgeInsets.all(widthOrHeight(context,choice:1)*0.05),
               decoration: const BoxDecoration(
                 color: Colors.deepPurple,
                 borderRadius: BorderRadius.all(Radius.circular(15))
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('A Summer Surpise',style: TextStyle(fontFamily: 'MyFont',color: Colors.white,fontSize:widthOrHeight(context,choice:1)*0.04 )),
                   Text('Cashback 20%',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'MyFont',fontSize:widthOrHeight(context,choice:1)*0.07,color: Colors.white)),
                 ],
               ),
             ),
            SizedBox(height: widthOrHeight(context,choice:0)*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: list,
            ),
            SizedBox(height: widthOrHeight(context,choice:0)*0.02,),
              buildRow(widthOrHeight(context,choice:1),'Special for you','See more',() {

              }),
            SizedBox(height: widthOrHeight(context,choice:0)*0.02,),
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
                      SizedBox(width: widthOrHeight(context,choice:1)*0.06,)
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: widthOrHeight(context,choice:0)*0.02,),
            buildRow(widthOrHeight(context,choice:1),'Popular Products','See more',() {

            }),
            SizedBox(height: widthOrHeight(context,choice:0)*0.02,),
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

  Row buildRow(double width,String title,String subTitle,VoidCallback callback) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text(title,style: TextStyle(fontSize: width*0.06,fontFamily: 'MyFont'),),
                TextButton(onPressed: callback, child: Text(subTitle,style: const TextStyle(color: Colors.grey,fontFamily: 'MyFont'))),

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