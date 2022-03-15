import 'package:flutter/material.dart';

class Homework extends StatefulWidget {
  const Homework({Key? key}) : super(key: key);

  @override
  _HomeworkState createState() => _HomeworkState();
}

class _HomeworkState extends State<Homework> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            backgroundColor: Colors.orange,
            leading: Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: IconButton(
                  icon: Icon(Icons.menu_sharp),
                  color: Colors.black,
                  iconSize: 30,
                  onPressed: () {},
                )),
            actions: [
              Padding(
                  padding: EdgeInsets.only(top: 10, right: 20),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  )),
            ],
            flexibleSpace: FlexibleSpaceBar(
                title: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                CircleAvatar(
                  backgroundColor: Color(0xFFEF5350),
                  radius: 34,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/rasm.jpeg'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Munavvarov O',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      //SizedBox(width: 20,height: 20,),
                      Row(
                        children: [
                          Text(
                            'My tasks',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          Column(
                            children: [
                              Text(''),
                              RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: Color(0xFF00838F),
                                child: Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.deepOrange,
                            child: Icon(
                              Icons.watch_later_outlined,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'To do',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text("5 tasks now . 1 started")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.orange,
                            child: Icon(
                              Icons.cloud_download,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'In Progress',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text("1 tasks now . 1 started")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.indigo,
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Done',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text("18 tasks now . 18 complite")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Active Projects',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFF00838F),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Color(0xFFEF5350),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFD180),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Color(0xFF2979FF),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
