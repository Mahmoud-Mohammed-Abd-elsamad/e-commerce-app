import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../Authentiction_Screens/screen/RegisterPage.dart';
import '../const.dart';
import '../const.dart';
import '../cubits/product_cupit/product_cubit.dart';
import '../models/product_model.dart';
import 'ProfileScreens/profile.dart';
import 'favorites/fav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = 'HomeScreenPage';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var width = double.infinity;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var listSelectedItems = [];
  List<DataM> listSelectedItemData = [];
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProductCubit>();

    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: _buildBottomNavigation(context),
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hello ",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${RegisterPage.emailAddress} ",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.waving_hand_outlined,
                    color: Colors.lightGreen,
                    size: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("Let's start shopping!",
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 170,

                //  width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Background/banner.jpg'),
                    fit: BoxFit.fill,
                    //
                    //
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("20% OFF DURING THE WEEKEND",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: Text("Get Now",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black))),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Row(
                  children: [
                    Text(
                      "Top Categories",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "See All",
                      style: TextStyle(fontSize: 15, color: Colors.lightGreen),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _buildGridView(cubit),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildGridView(ProductCubit cubit) {
    return Container(
      width: double.infinity,
      height: 500,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (BuildContext context, state) {
          if (state is ProductLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: colorBase,
              ),
            );
          } else if (state is ProductFauler) {
            return Center(
              child: Text(
                "ERROR",
                style: TextStyle(color: Colors.black, fontSize: 32),
              ),
            );
          } else {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,childAspectRatio: 2.5/3,
                    mainAxisSpacing: 20),
                itemCount: cubit.prodctsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _GridViewItemBuilder(index, cubit);
                });
          }
        },
      ),
    );
  }

  CurvedNavigationBar _buildBottomNavigation(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.lightGreen.withOpacity(.4),
      items: [
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
            child: Icon(
              Icons.home_outlined,
              color: color,
              size: 35,
            )),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, FavoritesScreen.id,
                  arguments: listSelectedItemData);
            },
            child:
                Icon(Icons.favorite_border_outlined, color: color, size: 35)),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, ProfileScreen.id);
            },
            child: Icon(CupertinoIcons.person_crop_circle,
                color: color, size: 35)),
      ],
      // onTap: (index) {
      //   setState(() {});
      // },
    );
  }

  InkWell _GridViewItemBuilder(int index, ProductCubit cubit) {
    return InkWell(
      onTap: () {
        if (listSelectedItems.contains(index)) {
          listSelectedItems.remove(index);
          listSelectedItemData.remove(cubit.prodctsList[index]);
        } else {
          listSelectedItems.add(index);
          listSelectedItemData.add(cubit.prodctsList[index]);
        }
        print("${listSelectedItemData[0].description}");
        setState(() {});
      },
      child: Container(
        child: _buildProducts(
            image: cubit.prodctsList[index].image,
            price: cubit.prodctsList[index].price.toString(),
            name: cubit.prodctsList[index].name.toString(),
            oldPrice: cubit.prodctsList[index].oldPrice.toString(),
            description: '',
            color: listSelectedItems.contains(index) ? Colors.red : Colors.grey),
      ),
    );
  }

  Widget _buildProducts(
      {required String image,
      required Color color,
      required String description,
      required String price,
      required String name,
      required String oldPrice}) {
    return _productsList(
        image: image,
        price: price,
        name: name,
        oldPrice: oldPrice,
        color: color);
  }

  Container _productsList(
      {required String image,
      required Color color,
      required String name,
      required String price,
      required String oldPrice}) {
    return Container(
      padding: EdgeInsets.all(10),
      //width: 160,
      width: width * .2,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        //color: Colors.red,
      ),
      child: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "50% OFF",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey[300],
                  child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: color,
                        size: 20,
                      )),
                )
              ],
            ),
            //SizedBox(height: 10,),
            Center(
                child: Image.network(
              image,
              width: 100,
              height: 100,
            )),
            //SizedBox(height: 10,),
            Text(
              name.substring(0, 8),
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "\$$price",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "₦$oldPrice",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: _buildAppBarIcons(icon: Icons.format_list_bulleted_outlined),
      actions: [
        _buildAppBarIcons(icon: CupertinoIcons.search),
      ],
    );
  }

  Widget _buildAppBarIcons({required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
          backgroundColor: Colors.grey[100],
          child: Icon(
            icon,
            color: Colors.black,
          )),
    );
  }
}
