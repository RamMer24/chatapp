import 'dart:io';

import 'package:chatapp/screen/SaveImage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class CHATPAGE extends StatefulWidget {
  var name = "";
  var photo = "";
  var email = "";
  var receiverid = "";

  CHATPAGE(
      {required this.name,
      required this.email,
      required this.photo,
      required this.receiverid});

  @override
  State<CHATPAGE> createState() => _CHATPAGEState();
}

class _CHATPAGEState extends State<CHATPAGE> {
  var senderid = "";

  getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      senderid = prefs.getString("senderid").toString();
    });
  }

  bool selected = false;

  bool isloading = false;

  bool showemoji = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  TextEditingController _msg = TextEditingController();
  ImagePicker _picker = ImagePicker();
  File? selectedimage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: WillPopScope(
          onWillPop: (){
            if(showemoji)
              {
              setState(() =>showemoji = !showemoji);
              return Future.value(false);

              }
            else
              {
                return Future.value(true);
              }
          },
          child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(
                  65,
                ),
                child: AppBar(
                  elevation: 0,
                  leading: Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 5,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                    ),
                  ),
                  leadingWidth: 20,
                  title: Padding(
                    padding: EdgeInsets.only(
                      top: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            widget.photo,
                            width: 50.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.email,
                                style: TextStyle(
                                  fontSize: 5,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        right: 25,
                      ),
                      child: Icon(
                        Icons.videocam_sharp,
                        size: 35,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        right: 25,
                      ),
                      child: Icon(
                        Icons.call,
                        size: 25,
                      ),
                    ),
                    PopupMenuButton(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        iconSize: 30,
                        onSelected: (value) {
                          if (value == 0) {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => imagesexample()));
                          } else if (value == 1) {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => fromexample()));
                          } else if (value == 2) {
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => Textbox()));
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              value: 0,
                              child: Text(
                                "New group",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text(
                                "media,links,and docs",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 4,
                              child: Text(
                                "mute notification",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 5,
                              child: Text(
                                "disappearing messages",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 6,
                              child: Text(
                                "wallpaper",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 7,
                              child: Text(
                                "more",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ];
                        }),

                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     top: 10,
                    //     right: 10,
                    //   ),
                    //   child: Icon(
                    //     Icons.more_vert,
                    //     size: 28,
                    //   ),
                    // ),
                  ],
                ),
              ),
              body: Stack(
                children: [
                  Container(
                    //height: 1500,
                    // width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("img/whatsapp.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("UserData")
                              .doc(senderid)
                              .collection("chats")
                              .doc(widget.receiverid)
                              .collection("message")
                              .orderBy("timestamp", descending: true)
                              .snapshots(),
                          builder: (BuildContext Context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data!.size <= 0) {
                                return Center(
                                  child: Text("No messages"),
                                );
                              } else {
                                return ListView(
                                  reverse: true,
                                  children: snapshot.data!.docs.map((document) {
                                    if (document["senderid"] == senderid) {
                                      return Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          margin: EdgeInsets.all(10.0),
                                          padding: EdgeInsets.all(10.0),
                                          color: Colors.blue.shade900,
                                          child: (document["type"] == "image")
                                              ? GestureDetector(
                                            onTap: (){
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(builder: (context) => SaveImage(
                                                    photo: document["msg"].toString(),
                                                    filename: document["filename"].toString(),

                                                  )));
                                            },
                                                child: Image.network(
                                                    document["msg"],
                                                    width: 100.0,
                                                  ),
                                              )
                                              : Text(
                                                  document["msg"].toString(),
                                                  style:
                                                      TextStyle(color: Colors.white),
                                                ),
                                        ),
                                      );
                                    } else {
                                      return Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          margin: EdgeInsets.all(10.0),
                                          padding: EdgeInsets.all(10.0),
                                          color: Colors.blue.shade900,
                                          child: (document["type"] == "image")
                                              ? Image.network(
                                                  document["msg"],
                                                  width: 100.0,
                                                )
                                              : Text(
                                                  document["msg"].toString(),
                                                  style:
                                                      TextStyle(color: Colors.white),
                                                ),
                                        ),
                                      );
                                    }
                                  }).toList(),
                                );
                              }
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    setState(() {
                                      showemoji = !showemoji;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.emoji_emotions_sharp,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 150,
                                  child: TextFormField(
                                    controller: _msg,
                                    style: TextStyle(
                                      fontSize: 19,
                                    ),
                                    onTap: (){
                                      if(showemoji);
                                      setState(() {
                                        showemoji = false;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "message",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    XFile? photo = await _picker.pickImage(
                                        source: ImageSource.gallery);
                                    selectedimage = File(photo!.path);
                                    setState(() {
                                      isloading = true;
                                    });
                                    var uuid = Uuid();
                                    var filename = uuid.v1().toString() + ".jpg";

                                    await FirebaseStorage.instance
                                        .ref(filename)
                                        .putFile(selectedimage!)
                                        .whenComplete(() {})
                                        .then((filedata) async {
                                      await filedata.ref
                                          .getDownloadURL()
                                          .then((fileurl) async {
                                        await FirebaseFirestore.instance
                                            .collection("UserData")
                                            .doc(senderid)
                                            .collection("chats")
                                            .doc(widget.receiverid)
                                            .collection("message")
                                            .add({
                                          "senderid": senderid,
                                          "receiverid": widget.receiverid,
                                          "msg": fileurl,
                                          "type": "image",
                                          "imagename":filename,
                                          "timestamp":
                                          DateTime.now().millisecondsSinceEpoch
                                        }).then((value) async {
                                          await FirebaseFirestore.instance
                                              .collection("UserData")
                                              .doc(widget.receiverid)
                                              .collection("chats")
                                              .doc(senderid)
                                              .collection("message")
                                              .add({
                                            "senderid": senderid,
                                            "receiverid": widget.receiverid,
                                            "msg": fileurl,
                                            "type": "image",
                                            "imagename":filename,
                                            "timestamp":
                                            DateTime.now().millisecondsSinceEpoch
                                          }).then((value) {
                                            setState(() {
                                              isloading = false;
                                            });
                                          });
                                        });
                                      });
                                    });
                                  },
                                  icon: Icon(Icons.browse_gallery),
                                ),

                                IconButton(
                                  onPressed: () async {
                                    XFile? photo = await _picker.pickImage(
                                        source: ImageSource.camera);
                                    selectedimage = File(photo!.path);
                                    setState(() {
                                      isloading = true;
                                    });
                                    var uuid = Uuid();
                                    var filename = uuid.v1().toString() + ".jpg";

                                    await FirebaseStorage.instance
                                        .ref(filename)
                                        .putFile(selectedimage!)
                                        .whenComplete(() {})
                                        .then((filedata) async {
                                      await filedata.ref
                                          .getDownloadURL()
                                          .then((fileurl) async {
                                        await FirebaseFirestore.instance
                                            .collection("UserData")
                                            .doc(senderid)
                                            .collection("chats")
                                            .doc(widget.receiverid)
                                            .collection("message")
                                            .add({
                                          "senderid": senderid,
                                          "receiverid": widget.receiverid,
                                          "msg": fileurl,
                                          "type": "image",
                                          "imagename":filename,
                                          "timestamp":
                                              DateTime.now().millisecondsSinceEpoch
                                        }).then((value) async {
                                          await FirebaseFirestore.instance
                                              .collection("UserData")
                                              .doc(widget.receiverid)
                                              .collection("chats")
                                              .doc(senderid)
                                              .collection("message")
                                              .add({
                                            "senderid": senderid,
                                            "receiverid": widget.receiverid,
                                            "msg": fileurl,
                                            "type": "image",
                                            "imagename":filename,
                                            "timestamp":
                                                DateTime.now().millisecondsSinceEpoch
                                          }).then((value) {
                                            setState(() {
                                              isloading = false;
                                            });
                                          });
                                        });
                                      });
                                    });
                                  },
                                  icon: Icon(Icons.camera_alt),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),

                          ),
                          (isloading)
                              ? CircularProgressIndicator()
                              : GestureDetector(
                                  onTap: () async {
                                    var message = _msg.text.toString();
                                    _msg.text = "";
                                    print("Receiver : " + widget.receiverid);
                                    print("Senderid : " + senderid);

                                    await FirebaseFirestore.instance
                                        .collection("UserData")
                                        .doc(senderid)
                                        .collection("chats")
                                        .doc(widget.receiverid)
                                        .collection("message")
                                        .add({
                                      "senderid": senderid,
                                      "receiverid": widget.receiverid,
                                      "msg": message,
                                      "type": "text",
                                      "imagename":"",
                                      "timestamp":
                                          DateTime.now().millisecondsSinceEpoch
                                    }).then((value) async {
                                      await FirebaseFirestore.instance
                                          .collection("UserData")
                                          .doc(widget.receiverid)
                                          .collection("chats")
                                          .doc(senderid)
                                          .collection("message")
                                          .add({
                                        "senderid": senderid,
                                        "receiverid": widget.receiverid,
                                        "msg": message,
                                        "type": "text",
                                        "imagename":"",
                                        "timestamp":
                                            DateTime.now().millisecondsSinceEpoch
                                      }).then((value) {
                                        _msg.text = "";
                                      });
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF00CE5E),
                                      borderRadius: BorderRadius.circular(
                                        30,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.send,
                                      size: 19,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      (showemoji)? SizedBox(
                        height: MediaQuery.of(context).size.height *.35,
                        child: EmojiPicker(
                          textEditingController: _msg,
                          config: Config(
                            columns: 7,
                            emojiSizeMax: 32 * (Platform.isIOS? 1.30 : 1.0),

                          ),
                        ),
                      ):SizedBox(),
                    ],
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
