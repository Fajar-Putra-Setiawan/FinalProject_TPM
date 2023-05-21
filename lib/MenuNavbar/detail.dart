import 'package:flutter/material.dart';
import 'package:project_akhir_anime_app/model/genshinemodel.dart';
import 'package:url_launcher/url_launcher.dart';


class HalamanDetail extends StatelessWidget {
  final Result? charList;
  const HalamanDetail({ Key? key, required this.charList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(charList!.name.toString()),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Image.asset('genshin_character/${charList!.name.toString()}.png'),

              const SizedBox(height: 40),
              Text(charList!.name.toString(),style: const TextStyle(color: Colors.black,fontSize: 30,fontFamily: 'Pacifico'),),
              Text(charList!.rarity.toString() + ' ⭐',style: const TextStyle(color: Colors.black,fontSize: 18),),
              const SizedBox(height: 25),
              Text(charList!.vision.toString(),style: const TextStyle(color: Colors.black,fontSize: 18),),
              const SizedBox(height: 25),
              Text(charList!.description.toString(),style: const TextStyle(color: Colors.black,fontSize: 18),),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => launch('https://genshin.hoyoverse.com/en/character/mondstadt?char=0'),
        child: const Icon(Icons.search,color: Colors.black  ,),
      ),
    );
  }

}




