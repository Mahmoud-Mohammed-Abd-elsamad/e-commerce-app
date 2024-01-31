import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../models/product_model.dart';
import '../HomeScrern/home_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  static String id = "FavoritesScreen";

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  @override
  Widget build(BuildContext context) {
    List<DataM>? reciveListData =
        ModalRoute.of(context)!.settings.arguments as List<DataM>;

    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: height * .12,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: Colors.black,
            )),
        title: const Text(
          "Favorites",
          style: TextStyle(
            fontSize: 23,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          height: 600,
          color: Colors.grey[100],
          child: ListView.builder(
              itemCount: reciveListData.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => _taskItemWithSlidable(
                  width: width, reciveListData: reciveListData, index: index)),
        ),
      ),
    );
  }

  Padding _listViewItemBilder(
      double width, List<DataM> reciveListData, int index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.white,
        height: 120,
        width: width * .9,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                child: Image.network(reciveListData[index].image ?? ""),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "\$${reciveListData[index].price}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "${reciveListData[index].name?.substring(0, 8)}",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "2.3 lbs",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              const Column(
                children: [
                  SizedBox(height: 15),
                  Icon(CupertinoIcons.add),
                  SizedBox(height: 5),
                  Text("5"),
                  SizedBox(height: 5),
                  Icon(CupertinoIcons.minus),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _taskItemWithSlidable(
      {required double width,
      required List<DataM> reciveListData,
      required int index}) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              reciveListData.removeAt(index);
              setState(() {});
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: _listViewItemBilder(width, reciveListData, index),
    );
  }
}
