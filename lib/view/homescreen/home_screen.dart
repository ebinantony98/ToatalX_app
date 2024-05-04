import 'package:flutter/material.dart';
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
                    decoration: InputDecoration(
                        hintText: "search by name",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black),
                  child: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                    size: 45,
                  ),
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
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.users.length,
                itemBuilder: (c, i) {
                  return Card(
                    child: ListTile(
                      title: Text(controller.users[i].name ?? ""),
                      subtitle: Text(controller.users[i].age.toString()),
                      // trailing: Wrap(direction: Axis.vertical, children: [
                      //   Text(time[index]),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      // ]),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(controller.users[i].image ?? ""),
                      ),
                    ),
                  );
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            
          },
          child: Icon(
            Icons.add,
            size: 50,
            color: Colors.white,
          ),
        ));
  }
}
