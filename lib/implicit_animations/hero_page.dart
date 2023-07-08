import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'detail_page.dart';

class HeroPage extends StatelessWidget {
  var listImages = [
    "https://fastly.picsum.photos/id/165/536/354.jpg?hmac=3U0MeDyOPgSqPmDhXtEZRTWV80bfX3cmko0I2uXX244",
    "https://fastly.picsum.photos/id/744/536/354.jpg?hmac=bSwcAxDxfkwDQOJVwmXCbVdtrDKEo5SBPK1ccKLzQm4",
    "https://fastly.picsum.photos/id/120/536/354.jpg?hmac=1H3aev3j5N1osdwXRVP3dAqR6RRUpoeOf0PNvRZcn_k",
    "https://fastly.picsum.photos/id/553/536/354.jpg?hmac=_eKSdchYCZH98R5ND5JJCACG421CpRVSdNfRH3sMmpY",
    "https://fastly.picsum.photos/id/165/536/354.jpg?hmac=3U0MeDyOPgSqPmDhXtEZRTWV80bfX3cmko0I2uXX244",
    "https://fastly.picsum.photos/id/744/536/354.jpg?hmac=bSwcAxDxfkwDQOJVwmXCbVdtrDKEo5SBPK1ccKLzQm4",
    "https://fastly.picsum.photos/id/120/536/354.jpg?hmac=1H3aev3j5N1osdwXRVP3dAqR6RRUpoeOf0PNvRZcn_k",
    "https://fastly.picsum.photos/id/553/536/354.jpg?hmac=_eKSdchYCZH98R5ND5JJCACG421CpRVSdNfRH3sMmpY",
    "https://fastly.picsum.photos/id/165/536/354.jpg?hmac=3U0MeDyOPgSqPmDhXtEZRTWV80bfX3cmko0I2uXX244",
    "https://fastly.picsum.photos/id/744/536/354.jpg?hmac=bSwcAxDxfkwDQOJVwmXCbVdtrDKEo5SBPK1ccKLzQm4",
    "https://fastly.picsum.photos/id/120/536/354.jpg?hmac=1H3aev3j5N1osdwXRVP3dAqR6RRUpoeOf0PNvRZcn_k",
    "https://fastly.picsum.photos/id/553/536/354.jpg?hmac=_eKSdchYCZH98R5ND5JJCACG421CpRVSdNfRH3sMmpY",
    "https://fastly.picsum.photos/id/165/536/354.jpg?hmac=3U0MeDyOPgSqPmDhXtEZRTWV80bfX3cmko0I2uXX244",
    "https://fastly.picsum.photos/id/744/536/354.jpg?hmac=bSwcAxDxfkwDQOJVwmXCbVdtrDKEo5SBPK1ccKLzQm4",
    "https://fastly.picsum.photos/id/120/536/354.jpg?hmac=1H3aev3j5N1osdwXRVP3dAqR6RRUpoeOf0PNvRZcn_k",
    "https://fastly.picsum.photos/id/553/536/354.jpg?hmac=_eKSdchYCZH98R5ND5JJCACG421CpRVSdNfRH3sMmpY",
    "https://fastly.picsum.photos/id/165/536/354.jpg?hmac=3U0MeDyOPgSqPmDhXtEZRTWV80bfX3cmko0I2uXX244",
    "https://fastly.picsum.photos/id/744/536/354.jpg?hmac=bSwcAxDxfkwDQOJVwmXCbVdtrDKEo5SBPK1ccKLzQm4",
    "https://fastly.picsum.photos/id/120/536/354.jpg?hmac=1H3aev3j5N1osdwXRVP3dAqR6RRUpoeOf0PNvRZcn_k",
    "https://fastly.picsum.photos/id/553/536/354.jpg?hmac=_eKSdchYCZH98R5ND5JJCACG421CpRVSdNfRH3sMmpY"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GridView.builder(
        itemCount: listImages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
            childAspectRatio: 2/1
      ), itemBuilder: (ctx, index){
        return InkWell(
          onTap: (){
            Navigator.push(context, PageTransition(
                child: DetailPage(imgUrl: listImages[index]),
                childCurrent: HeroPage(),
                curve: Curves.bounceInOut,
                duration: Duration(
                  seconds: 2
                ),
                reverseDuration: Duration(
                    seconds: 2
                ),
                type: PageTransitionType.bottomToTopJoined, alignment: Alignment.center),

            );
          },
            child: Image.network(listImages[index], fit: BoxFit.fill,));
      }),
    );
  }
}
