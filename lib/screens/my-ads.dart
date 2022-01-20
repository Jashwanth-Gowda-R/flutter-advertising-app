import 'package:adlisting/custom-widgets/my-ads-card.dart';
import 'package:adlisting/data/my-ads-data.dart';
import 'package:adlisting/screens/manage-ad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  _MyAdsScreenState createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  MyAdsData adsData = MyAdsData();

  List _ads = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _ads = adsData.ads;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Ads"),
      ),
      body: Container(
        padding: EdgeInsets.all(4.0),
        child: ListView.builder(
          itemCount: _ads.length,
          itemBuilder: (bc, index) {
            var timesAgo =
                timeago.format(DateTime.parse(_ads[index]["createdAt"]));
            return GestureDetector(
              onTap: () {
                Get.to(ManageAdScreen(isEdit: true, product: _ads[index]));
              },
              child: MyAdsCard(
                imageURL: _ads[index]['images'][0],
                title: _ads[index]['title'],
                price: _ads[index]['price'].toDouble(),
                timeAgo: timesAgo,
              ),
            );
          },
        ),
      ),
    );
  }
}
