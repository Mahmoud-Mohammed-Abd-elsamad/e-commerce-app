import 'package:flutter/material.dart';
import '../../const.dart';
import '../Authentiction_Screens/screen/LoginPage.dart';
import '../Authentiction_Screens/screen/RegisterPage.dart';
import '../FavoriteScreen/favorite.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: height * .01,
                ),
                _accountdata(
                    account: '${RegisterPage.emailAddress}',
                    username: "${RegisterPage.emailAddress!.split('@').first} ",
                    img: const NetworkImage(avatarimg)),
                InkWell(
                  onTap: () {
                    showAlertDialog(context);
                    setState(() {});
                  },
                  child: _buildRow(
                      text: ("about me"), imgpath: 'assets/icons/profile.png'),
                ),
                _buildRow(
                    text: ("My Orders"),
                    imgpath: 'assets/icons/myorders 202.png'),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoritesScreen(),
                        ));
                  },
                  child: InkWell(
                    onTap: () {},
                    child: _buildRow(
                        text: ("My Favorites"),
                        imgpath: 'assets/icons/myfav.png'),
                  ),
                ),
                _buildRow(
                    text: ("My Address"), imgpath: 'assets/icons/location.png'),
                _buildRow(
                    text: ("Credit Cards"), imgpath: 'assets/icons/credit.png'),
                _buildRow(
                    text: ("Transactions"),
                    imgpath: 'assets/icons/transactions.png'),
                _buildRow(
                    text: ("Notifications"),
                    imgpath: 'assets/icons/Notifications.png'),
                InkWell(
                  onTap: () {onTap:() =>  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      LoginPage()), (Route<dynamic> route)=>false);

                  },
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage('assets/icons/Sign out.png'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (Route<dynamic> route) => false),
                        child: const Text(
                          "Sign out",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),SizedBox(height: 40,)
              ],
            )),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("about me"),
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name: ${RegisterPage.emailAddress!.split('@').first} ",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Phone: ${RegisterPage.phoneNumber ?? '01015415210'}",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Email: ${RegisterPage.emailAddress}",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Password: ${RegisterPage.password}",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
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
      const SizedBox(
        height: 8,
      ),
      Text(
        username,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 3,
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
  return SizedBox(
    height: 30,
    child: Row(
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
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Image(
          image: AssetImage('assets/icons/arrow.png'),
        ),
        //SizedBox(width: width*.05,)
      ],
    ),
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
