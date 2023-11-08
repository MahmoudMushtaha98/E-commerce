import 'package:evgo/widget/set_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);


  List<CardOfIcon> listView = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        toolbarHeight: 20,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(height: height*0.02,),
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
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.all(width*0.04),
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
          ListView(
            scrollDirection: Axis.horizontal,
            children: ,
          )
        ],
      ),
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