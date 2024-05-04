import 'package:flutter/material.dart';
import 'package:toatlx_machine_test/view/homescreen/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomeController extends ChangeNotifier {
  List<User> users = [];
  String selectedSortingOption = 'All';

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

  Future<void> selectImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Use the picked image
      File image = File(pickedFile.path);
    } else {}
  }

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  updateSelection(value) {
    selectedSortingOption = value ?? "";
    notifyListeners();
  }

  TextEditingController textEditingController = TextEditingController();
  List<User> searchList = [];
  search(String v) {
    isLoading = true;
    if (v.isEmpty) {
      isLoading = false;
      searchList = users;
    }
    if (v.isNotEmpty) {
      searchList = [];
      for (User item in users) {
        if (item.name.toString().startsWith(v)) {
          searchList.add(item);
        }
      }
      isLoading = false;
    }
    isLoading = false;
  }
}
