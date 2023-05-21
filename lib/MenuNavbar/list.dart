import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_akhir_anime_app/dashboard.dart';
import 'package:project_akhir_anime_app/model/user_model.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Box<User> userBox;

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    openHiveBox(); // Call the method to open the box
  }

  Future<void> openHiveBox() async {
    await Hive.initFlutter();
    await Hive.openBox<User>("users"); // Open the box
    userBox = Hive.box<User>("users"); // Assign the box to the variable
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          },
        ),
      ),
      body: FutureBuilder(
        future: openHiveBox(), // Call the method to open the box
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('snapshot error'),
              );
            } else {
              var users = Hive.box<User>("users"); // Specify the type of the box
              if (users.length == 0) {
                users.add(User('fajar', 'fajar1'));
                users.add(User('fajar', 'fajar2'));
              }
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  User user = users.getAt(index)!; // Add a null check (!)
                  return Text(user.username + '   &   ' + user.password);
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
