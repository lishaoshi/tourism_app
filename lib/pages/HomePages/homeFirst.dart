
import "package:flutter/material.dart";
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeFirse extends StatefulWidget {
  HomeFirse({Key key}) : super(key: key);

  @override
  _HomeFirseState createState() => _HomeFirseState();
}

class _HomeFirseState extends State<HomeFirse> {
  ScrollController _scrollController = ScrollController();
   List<String> _imageUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
  ];
  double setOff = 100;
  double opcityF = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      // print(_scrollController.offset);
      if(_scrollController.offset<=0) {
        setState(() {
          opcityF=0;
        });
      } else if(_scrollController.offset>=setOff) {
         setState(() {
          opcityF=1;
        });
      } else {
         setState(() {
          opcityF=_scrollController.offset/setOff;
        });
      }
     
    });
  }
  final SwiperControl _control = SwiperControl();
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true, 
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              controller: _scrollController,
              children: <Widget>[
                Container(
                  height: 200,
                  child: Swiper(
                    itemHeight: 200,
                    itemBuilder: (context, index){
                      return Image.network(
                        _imageUrls[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: _imageUrls.length,
                    pagination: SwiperPagination(
                      alignment: Alignment.bottomRight
                    ),
                    autoplay: true,
                    control: _control
                  )
                ),
                Container(
                  height: 1000,
                  child: Text('123456')
                )
              ],
            ),
            Opacity(opacity: this.opcityF,child: Container(
              color: Colors.red,
              height: 100,
            ),)
          ]
        )
      )
    );
  }
}