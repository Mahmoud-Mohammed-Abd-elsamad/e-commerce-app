import 'package:flutter/material.dart';
import '../Authentiction_Screens/screen/LoginPage.dart';
import '../Authentiction_Screens/screen/RegisterPage.dart';
import '../const.dart';
import 'favorites/fav.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String id = "ProfileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    const SingleChildScrollView();
    return Scaffold(
      body: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * .1, vertical: height * .06),
            child: Column(
              children: [
                SizedBox(
                  height: height * .08,
                ),
                _accountdata(
                    account: '${RegisterPage.emailAddress}',
                    username: "user name",
                    img: const NetworkImage(avatarimg)),
                SizedBox(
                  height: height * .03,
                ),
                InkWell(onTap: (){
                  showAlertDialog(context);
                  setState(() {

                  });
                },
                  child: _buildRow(
                      text: ("about me"), imgpath: 'assets/icons/profile.png'),

                ),
                SizedBox(
                  height: height * 0.03,
                ),
                _buildRow(
                    text: ("My Orders"),
                    imgpath: 'assets/icons/myorders 202.png'),
                SizedBox(
                  height: height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoritesScreen(),
                        ));
                  },
                  child: InkWell(
                    onTap: (){
                      // Navigator.push<void>(
                      //   context,
                      //   MaterialPageRoute<void>(
                      //     builder: (BuildContext context) => const FavoritesScreen(),
                      //   ),
                      // );
                    },
                    child: _buildRow(
                        text: ("My Favorites"),
                        imgpath: 'assets/icons/myfav.png'),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                _buildRow(
                    text: ("My Address"), imgpath: 'assets/icons/location.png'),
                SizedBox(
                  height: height * 0.03,
                ),
                _buildRow(
                    text: ("Credit Cards"), imgpath: 'assets/icons/credit.png'),
                SizedBox(
                  height: height * 0.03,
                ),
                _buildRow(
                    text: ("Transactions"),
                    imgpath: 'assets/icons/transactions.png'),
                SizedBox(
                  height: height * 0.03,
                ),
                _buildRow(
                    text: ("Notifications"),
                    imgpath: 'assets/icons/Notifications.png'),
                SizedBox(
                  height: height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MyOrders() //here pass the actual values of these variables, for example false if the payment isn't successfull..etc
                          ),
                    );
                  },
                  child:  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/icons/Sign out.png'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(onTap:() =>  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          LoginPage()), (Route<dynamic> route) => false) ,
                        child: Text(
                          "Sign out",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}


showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("about me"),
    content: Column(

      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("email: ${RegisterPage.emailAddress}."),
        SizedBox(height: 5,),
        Text("password: ${RegisterPage.password}."),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget _accountdata({
  required String account,
  required String username,
  required img,
}) {
  return Column(
    children: [
      SizedBox(
          height: 80,
          width: 80,
          child: CircleAvatar(
            backgroundImage: img,
          )),
      Text(
        username,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        account,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      )
    ],
  );
}

Widget _buildRow({
  required String text,
  required imgpath,
}) {
  return Row(
    children: [
      //Icon(icon as IconData?,color: const Color.fromARGB(255, 40, 180, 70),),
      Image(
        image: AssetImage(imgpath),
      ),
      const SizedBox(
        width: 15,
      ),
      Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      const Image(
        image: AssetImage('assets/icons/arrow.png'),
      ),
      //SizedBox(width: width*.05,)
    ],
  );
}

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 167, 217, 119), Colors.green],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: const Center(
          child: Text(
            "My Orders",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
