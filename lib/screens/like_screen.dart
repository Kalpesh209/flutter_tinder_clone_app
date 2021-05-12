import 'package:flutter/material.dart';
import 'package:flutter_tinder_clone_app/common/color_constants.dart';
import 'package:flutter_tinder_clone_app/data/likes_json.dart';

/*
Title:LikesScreen
Purpose:LikesScreen
Created By:Kalpesh Khandla
*/

class LikesScreen extends StatefulWidget {
  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kWhite,
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.only(bottom: 90),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                likes_json.length.toString() + " Likes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Top Picks",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.kBlack.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 0.8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: List.generate(likes_json.length, (index) {
              return Container(
                width: (size.width - 15) / 2,
                height: 250,
                child: Stack(
                  children: [
                    Container(
                      width: (size.width - 15) / 2,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage((likes_json[index]['img'])),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      width: (size.width - 15) / 2,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                ColorConstants.kBlack.withOpacity(0.25),
                                ColorConstants.kBlack.withOpacity(0),
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          likes_json[index]['active']
                              ? Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, bottom: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: ColorConstants.kGreen,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Recently Active",
                                        style: TextStyle(
                                          color: ColorConstants.kWhite,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, bottom: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: ColorConstants.kGrey,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Offline",
                                        style: TextStyle(
                                          color: ColorConstants.kWhite,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              width: size.width - 70,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    ColorConstants.yellow_one,
                    ColorConstants.yellow_two,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  "SEE WHO LIKES YOU",
                  style: TextStyle(
                    color: ColorConstants.kWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
