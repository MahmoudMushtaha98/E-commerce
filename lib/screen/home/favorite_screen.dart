import 'package:evgo/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../widget/popular_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {



  @override
  void initState() {
    for (var element in fav) {
      iconsBut.add(true);
    }super.initState();
  }

  List<bool> iconsBut = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(width: double.infinity,),
          Text('Favorite',style: TextStyle(fontFamily: 'MyFont',fontSize: widthOrHeight(context, choice: 1)*0.1),),
          SizedBox(height: widthOrHeight(context, choice: 0)*0.05,),
          SingleChildScrollView(
            child: Column(
              children: List.generate(fav.length, (index) {
                return Column(
                  children: [
                    ListTile(
                      title: SizedBox(
                        width: widthOrHeight(context, choice: 1)*0.4,
                          child: Text(fav[index].title,style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: 'MyFont'),)
                      ),
                      leading: SizedBox(
                        width: widthOrHeight(context, choice: 1)*0.2,
                          child: Image.asset(fav[index].path)),
                      trailing:  IconButton(
                        onPressed: () {
                          setState(() {
                            iconsBut[index]=!iconsBut[index];
                            if(!iconsBut[index]){
                              fav.remove(fav[index]);
                            }
                          });
                        },icon: Icon(Icons.favorite,color:(iconsBut[index])? Colors.red:Colors.grey,),
                      ),
                      subtitle: Text(fav[index].price),
                    ),
                    const Divider()
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
