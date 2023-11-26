import 'package:evgo/model/items_model.dart';
import 'package:evgo/screen/home/shop_screen.dart';
import 'package:evgo/screen/sign_up/login_screen.dart';
import 'package:flutter/material.dart';

import '../sign_up/complete_profile.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<ItemsModel> popFav = [];

  @override
  void initState() {
    int index = 0;
    for (var element in liked) {
      if (element) {
        popFav.add(populars[index]);
        counter++;
      }
      index++;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite',
            style: TextStyle(color: Colors.deepOrange, fontFamily: 'MyFont')),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: List.generate(popFav.length, (index) {
          return ListTile(
            title: Text(
              popFav[index].title,
              style:
                  const TextStyle(fontFamily: 'MyFont', fontWeight: FontWeight.bold),
            ),
            leading: Image.network(popFav[index].image),
            subtitle: Text(
              popFav[index].price,
              style: const TextStyle(fontFamily: 'MyFont', color: Colors.deepOrange),
            ),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  liked[popFav[index].id - 1] = !liked[popFav[index].id - 1];
                  popFav.remove(popFav[index]);
                });
              },
              child: Container(
                width: widthOrHeight(context, choice: 1) * 0.1,
                height: widthOrHeight(context, choice: 0) * 0.03,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (liked[popFav[index].id - 1])
                      ? Colors.pink.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.favorite,
                  size: widthOrHeight(context, choice: 1) * 0.04,
                  color:
                      (liked[popFav[index].id - 1]) ? Colors.pink : Colors.grey,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}


List<ItemsModel> popFav = [];
int counter = 0;
