import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'Login.dart';


class MyDashBoard extends StatefulWidget {
  const MyDashBoard({Key? key}) : super(key: key);

  @override
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {

  late SharedPreferences logindata;
  late String username ;

  @override
  void initState() {
    initial();
    // TODO: implement initState
    super.initState();
  }

  void initial() async
  {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString("username")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.redAccent[700],
          title: Padding(
            padding: const EdgeInsets.only(right: 40,top: 5),
            child: Center(child: Image.asset('assets/images/logo.png',height: 180,)),
          ),
          // bottom: PreferredSize(
          //   preferredSize: Size(100,50),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: TextField(
          //       decoration: InputDecoration(
          //           suffixIcon: Icon(Icons.search),
          //           border: OutlineInputBorder(
          //           )
          //       ),
          //     ),
          //   ),)
      ),
      drawer: Drawer(

        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              height: 180,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.redAccent[700]
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CircleAvatar(
                      radius: 50,

                      backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXi9ATL3oIc4dCZHB5M8QXgC2XPg5dabh3hA&usqp=CAU"),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$username",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),

                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications_none_outlined),
              title: Text("Notification"),

            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text("Settings"),

            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("About Us"),

            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.currency_rupee),
              title: Text("Payment Details"),

            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.feedback_outlined),
              title: Text("Feedback"),

            ),
            Divider(),
            ElevatedButton(
                onPressed: (){
                  logindata.setBool("login",true);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                },
                child: Text("Logout"))
          ],
        ),

      ),
      body: Column(
        children: [
          Text("Welcome Home"),
          Text("$username"),

        ],
      ),
    );
  }
}