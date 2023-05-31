import 'package:flutter/material.dart';


class KesanPesan extends StatelessWidget {
  const KesanPesan({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Kesan dan Pesan",style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
              Icon(
                Icons.star,
                size: 100,
                color: Colors.yellow,
              ),

              SizedBox(height: 40),
              Text("Saran : Materi mungkin di sesuaikan dengan perkembangan SDK yang sekarang, karena sering error jika ketika di demokan langsung",style: TextStyle(fontSize: 18,color: Colors.black),),
              SizedBox(height: 20),
              Text("Kesan : Baik, Seru, Santai dan Tugas nya ga ribet",style: TextStyle(fontSize: 18,color: Colors.black)),
          ],
        ),
      ),

    );
  }

}




