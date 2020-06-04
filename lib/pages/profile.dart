import 'package:flutter/material.dart';
import 'package:newapp/imports/navbar.dart';
import 'package:newapp/pages/profile_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './profile_drawer.dart';

class ProfilePage extends StatefulWidget {
  @override  
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  String username;
  String fullname;

  void getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username");
      fullname = prefs.getString("fullname");
      prefs.setInt("navbarIndex", 1);
    });
  }
  @override
  void initState() {
    getUserInfo();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,  
      ),
      drawer: ProfileDrawer(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.grey[300]),
        child: Navbar()
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration : BoxDecoration(
                gradient: LinearGradient( 
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                colors: [Colors.blue[400],Colors.blue[100]],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft : Radius.circular(50.0),
                  bottomRight : Radius.circular(50.0),
                )
              ),
              child : Container(
                width : double.infinity,
                height : 245.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(height:10.0,),
                    Hero(
                      tag: 'assets/images/Sembolic.jpg',
                      child: Container(
                        height: 125.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(62.5),
                          border: Border.all(
                            color: Colors.blue[100],
                            width: 2,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/Sembolic.jpg')
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      '$fullname',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white, 
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '$username',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height : 10.0,),
                  ],
                ),
              ),
            ),
            SizedBox(height : 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children :<Widget>[
                Icon(Icons.favorite,color : Colors.red,size : 80.0)
              ]
            ),
            SizedBox(height : 10.0,),
            Container(
              decoration : BoxDecoration(
                gradient: LinearGradient( 
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue[100],Colors.blue[400]],
                ),
                borderRadius: BorderRadius.only(
                  topLeft : Radius.circular(50.0),
                  topRight : Radius.circular(50.0),
                )
              ),
              child : Container(
                width : double.infinity,
                height : 200.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(height:40.0,),
                    Hero(
                      tag: 'assets/images/Sembolic.jpgg',
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(62.5),
                          border: Border.all(
                            color: Colors.blue[100],
                            width: 2,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/Sembolic.jpg')
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      '$fullname',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height : 10.0,),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}