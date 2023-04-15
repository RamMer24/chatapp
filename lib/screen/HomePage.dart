

import 'package:chatapp/screen/CHATPAGE.dart';
import 'package:chatapp/screen/LoginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {




  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  var name="";
  var email="";
  var photo="";
  var googleid="";
  getdata()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name=prefs.getString("Name").toString();
      email=prefs.getString("Email").toString();
      photo=prefs.getString("Photo").toString();
      googleid=prefs.getString("Googleid").toString();
    });
  }

  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to go back?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,

          child: (email!="")?StreamBuilder(
            stream: FirebaseFirestore.instance.collection("UserData").where("email",isNotEqualTo: email).snapshots(),
            builder: (BuildContext Context, AsyncSnapshot<QuerySnapshot> snapshot)
            {
              if (snapshot.hasData)
              {
                if(snapshot.data!.size<=0)
                {
                  return Center(
                    child: Text("No Data"),
                  );
                }
                else
                {
                  return GestureDetector(

                    child: ListView(

                      children: snapshot.data!.docs.map((document){

                        return ListTile(
                          onTap: ()async{
                            var id = document.id.toString();
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>CHATPAGE(
                                  name: document["displayName"],
                                  email: document["email"],
                                  photo: document["Photo"].toString(),
                                  receiverid: id,
                                )));
                          },
                          title: Text(document["displayName"]),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(document["Photo"].toString()),
                          ),
                          subtitle: Text(document["email"]),
                        );
                      }).toList(),
                    ),

                  );
                }
              }
              else
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ):SizedBox(),
        ),

        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(

                    child:Image.network(photo),

                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Text(name ,style: TextStyle(fontSize: 20),),
              SizedBox(
                height: 20,
              ),
              Text(email,style: TextStyle(fontSize: 20),),
              SizedBox(
                height: 20,
              ),
              Text(googleid,style: TextStyle(fontSize: 18),),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: ()async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();

                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.signOut();

                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
                  child: Text("log out"))
            ],

          ),
        ),
      ),
    );
  }
}
