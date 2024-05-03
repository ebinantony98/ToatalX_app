import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          color: Colors.black,
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              Text(
                "Nilambur",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.black),
              child: Icon(Icons.filter_list),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Users List",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            ListView(
              shrinkWrap: true,
            )
          ],
        )
      ],
    ));
  }
}
