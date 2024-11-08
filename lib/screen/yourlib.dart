import 'package:flutter/material.dart';
import 'package:sopify/service/category_oparation.dart';

class Yourlib extends StatelessWidget {
  const Yourlib({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Fav Song',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                favoutiteList[index].imageURL,
              ),
              title: Text(
                favoutiteList[index].name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
        itemCount: favoutiteList.length,
      ),
    );
  }
}
