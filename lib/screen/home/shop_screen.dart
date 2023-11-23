import 'package:dio/dio.dart';
import 'package:evgo/screen/home/details_screen.dart';
import 'package:evgo/screen/sign_up/login_screen.dart';
import 'package:evgo/widget/card_icon.dart';
import 'package:evgo/widget/popular_widget.dart';
import 'package:evgo/widget/special_for_you.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../model/items_model.dart';
import '../sign_up/complete_profile.dart';

class ShopScreen extends StatefulWidget {
   const ShopScreen({Key? key}) : super(key: key);

   static const screenRoute = '/shop-screen';

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {



  final dio = Dio();
  List itemsDetails = [];


  Future<void> httpReq() async {
    final response = await dio.get('https://fakestoreapi.com/products');

    itemsDetails = response.data;
    populars.clear();
    if (mounted) {
      setState(() {
        for (var element in itemsDetails) {
          populars.add(ItemsModel(
              id: element['id'],
              title: element['title'],
              price: element['price'].toString(),
              description: element['description'],
              category: element['category'],
              image: element['image'],
              rate: element['rating']['rate'],
              count: element['rating']['count']));
          liked.add(false);
        }
      });

    }
  }


  @override
  void initState() {
    httpReq();
    super.initState();
  }

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


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        toolbarHeight: 20,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: widthOrHeight(context,choice:1)*0.03,vertical: widthOrHeight(context,choice:1)*0.03),
            child: Column(
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
                SizedBox(height: widthOrHeight(context,choice:0)*0.001,),
                buildRow(widthOrHeight(context,choice:1),'Special for you','See more',() {

                }),
              ],
            ),
          ),
          SizedBox(height: widthOrHeight(context,choice:0)*0.001,),
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(left: widthOrHeight(context, choice: 1)*0.03),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthOrHeight(context, choice: 1)*0.03),
            child: buildRow(widthOrHeight(context,choice:1),'Popular Products','See more',() {

            }),
          ),
          SizedBox(height: widthOrHeight(context,choice:0)*0.02,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding:  EdgeInsets.only(left: widthOrHeight(context, choice: 1)*0.03),
              child: Row(
                children: List.generate(populars.length, (index){
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context, DetailsScreen.screenRoute,
                            arguments: {
                              'image':populars[index].image,
                              'title':populars[index].title,
                              'description':populars[index].description,
                              'fav':liked[index],
                              'rate': populars[index].rate
                            }
                          );
                        },
                          child: Stack(
                            children: [
                              PopularProduct(path: populars[index].image, title: populars[index].title, price: populars[index].price),
                              Positioned(
                                bottom: widthOrHeight(context, choice: 0)*0.007,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        liked[index]=!liked[index];
                                      });
                                    },
                                    child: Container(
                                    width: widthOrHeight(context, choice: 1)*0.1,
                                    height: widthOrHeight(context, choice: 0)*0.03,
                                    decoration: BoxDecoration(
                                    color: (liked[index])?Colors.pink.withOpacity(0.2):Colors.grey.withOpacity(0.2),
                                    shape: BoxShape.circle
                                                                    ),
                                      child: Icon(Icons.favorite,
                                        size: widthOrHeight(context, choice: 1)*0.04,
                                        color: (liked[index])?Colors.pink:Colors.grey.withOpacity(0.2),
                                      ),
                                      ),
                                  )
                              )
                            ],
                          )),
                      SizedBox(width: widthOrHeight(context, choice: 1)*0.1,)
                    ],
                  );
                }
                ),
              ),
            )
          )
        ],
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


List<ItemsModel> populars = [];
List<bool> liked = [];