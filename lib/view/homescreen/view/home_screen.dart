import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:toatlx_machine_test/view/homescreen/controller/homecontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    final controller = Provider.of<HomeController>(context, listen: false);
    controller.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Scaffold(
        body: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              // height: ,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Nilambur",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  child: TextFormField(
                    onChanged: (v) {
                      controller.search(v);
                    },
                    controller: controller.textEditingController,
                    decoration: InputDecoration(
                        hintText: "search by name",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black),
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (c) {
                          return AlertDialog(
                            title: Text(
                              'Sort',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RadioListTile(
                                  title: Text('All'),
                                  value: 'All',
                                  groupValue: controller.selectedSortingOption,
                                  onChanged: (value) {
                                    controller.updateSelection(value);
                                  },
                                ),
                                RadioListTile(
                                  title: Text('Age: Elder'),
                                  value: 'Age: Elder',
                                  groupValue: controller.selectedSortingOption,
                                  onChanged: (value) {
                                    controller.updateSelection(value);
                                  },
                                ),
                                RadioListTile(
                                  title: Text('Age: Younger'),
                                  value: 'Age: Younger',
                                  groupValue: controller.selectedSortingOption,
                                  onChanged: (value) {
                                    controller.updateSelection(value);
                                  },
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Users List",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            controller.textEditingController.text.isNotEmpty &&
                    controller.searchList.length == 0
                ? Center(
                    child: Text("No data"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.textEditingController.text.isNotEmpty
                        ? controller.searchList.length
                        : controller.users.length,
                    itemBuilder: (c, i) {
                      return Card(
                        child: ListTile(
                          title: Text(controller.users[i].name ?? ""),
                          subtitle: Text(controller.users[i].age.toString()),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage(controller.users[i].image ?? ""),
                          ),
                        ),
                      );
                    })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            showDialog(
                context: context,
                builder: (c) => Dialog(
                      child: Container(
                        height: 400,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add A New User",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Center(
                              child: InkWell(
                                child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue,
                                    child: Icon(Icons.person)),
                                onTap: () async {
                                  await controller.selectImage(c);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Name',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.grey.shade300)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Age',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.grey.shade300)),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.grey),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.blue),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('User added successfully!'),
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Save'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
          },
          child: Icon(
            Icons.add,
            size: 50,
            color: Colors.white,
          ),
        ));
  }
}
