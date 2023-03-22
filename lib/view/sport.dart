import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saqwqw/controller/news_controller.dart';
import 'package:saqwqw/model/news.dart';
import 'package:url_launcher/url_launcher.dart';


class Sport extends GetWidget {

  NewsController controller=Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getData("sports"),
        builder: (context,AsyncSnapshot snapshot){
          Articles? data =snapshot.data;
          if(snapshot.hasData){
            return ListView.builder(
            itemCount: data!.articles?.length,
            itemBuilder: (context,int index){
              return Card(
                elevation:10,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
     
                ),
                child:Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.3,
                      child: Image.network(data.articles![index].urlToImage.toString())),
                    InkWell(
                      child: Text(data.articles![index].title.toString(),
                       style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                       textDirection: TextDirection.rtl,),
                      onTap:()=> _launchUrl("${data.articles![index].url}"),
                       
                    ),
                    Text(
                      data.articles![index].description.toString(),
                      style: TextStyle(fontSize: 15, color:Colors.blueGrey),
                      textDirection: TextDirection.rtl,),
                    Text(data.articles![index].publishedAt.toString()),
                    Text("Source: "+data.articles![index].source!.name.toString()),
                  ],
                )
              );

            });
          }else {
            return Center(child: CircularProgressIndicator());
          }
          
        }),
      
    );
  }
   _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}