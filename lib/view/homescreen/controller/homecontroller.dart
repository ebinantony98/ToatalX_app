import 'package:flutter/material.dart';
import 'package:toatlx_machine_test/view/homescreen/models/user_model.dart';

class HomeController extends ChangeNotifier {
  List<User> users = [];

  Future<void> getAllUsers() async {
    users = [
      User(
        name: "Martin Dokidis",
        age: 34,
        image: "assets/images/female1.jpg",
      ),
      User(name: "Marilyn Rosser", age: 34, image: "assets/images/male1.jpg"),
      User(
        name: "Cristofer Lipshutz",
        age: 34,
        image: "assets/images/female2.jpg",
      ),
      User(name: "Wilson Botosh", age: 34, image: "assets/images/female3.jpg"),
      User(
        name: "Anika Saris",
        age: 62,
        image: "assets/images/female1.jpg",
      ),
      User(
        name: "Phillip Gouse",
        age: 65,
        image: "assets/images/male2.jpg",
      ),
      User(
        name: "Wilson Bergson",
        age: 65,
        image: "assets/images/female3.jpg",
      )
    ];
    notifyListeners();
  }
}
