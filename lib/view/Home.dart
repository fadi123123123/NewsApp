import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saqwqw/controller/news_controller.dart';
import 'package:saqwqw/view/health.dart';
import 'package:saqwqw/view/sport.dart';
import 'package:saqwqw/view/technology.dart';

class Home extends GetWidget {
  
  NewsController controller=Get.put(NewsController());
  List<Widget> screens=[
    Technology(),
    Sport(),
    Health()
  ];
  List<String> name=[
    "General News",
    "Sports News",
    "Health News",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<NewsController>(
          builder: (controller) {
            return Text(name[controller.currentIndex.value]);
          }
        ),),
      bottomNavigationBar: GetX<NewsController>(builder: (controller)=>BottomNavigationBar(
        selectedItemColor: Colors.blue,
        currentIndex: controller.currentIndex.value,
        onTap: (value){
          controller.currentIndex.value=value;
        },
        items: [
        BottomNavigationBarItem(
          label:"General", icon: Icon(Icons.travel_explore_sharp),
        ),
        BottomNavigationBarItem(
          label:"Sporsts", icon: Icon(Icons.sports_baseball,)
        ),
        BottomNavigationBarItem(
          label:"Health", icon: Icon(Icons.health_and_safety),
        ),
      ],),),
      body: GetX<NewsController>(builder: (controller)=>screens[controller.currentIndex.value]
      ,),
    );
  }
}