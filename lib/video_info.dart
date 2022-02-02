import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;
import 'home_page.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {

  List videoinfo =[];
  bool _playArea=false;
  late VideoPlayerController _controller;

  _initData() async {
    await DefaultAssetBundle.of(context).loadString('json/videoinfo.json').then((value){
     setState(() {
       videoinfo = json.decode(value);
     });
    });

  }

  @override
  void initState(){
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration:_playArea==false?
      BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.AppColor.gradientFirst.withOpacity(0.8),
            color.AppColor.gradientSecond,
          ],
              begin: const FractionalOffset(0.0, 0.4),
        end: Alignment.topRight,
        )
      ):BoxDecoration(
        color: color.AppColor.gradientSecond,
      ),
          child: Column(
            children: [
              _playArea==false?Container(
                padding: const EdgeInsets.only(top:70,left:30,right:30 ),
                width: MediaQuery.of(context).size.width,
                height:300,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap:() {
                            // Get.to(()=> HomePage());
                            Get.back();

        },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: color.AppColor.secondPageIconColor,

                          ),
                        ),
                        Expanded(child:Container()),
                        Icon(
                          Icons.info_outline_rounded,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,

                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                      Text('Legs Toning',
                        style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.secondPageTitleColor
                        ),),
                      SizedBox(height: 5,),
                      Text('and Glutes Workout',
                        style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.secondPageTitleColor
                        ),),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors:[
                                color.AppColor.secondPageContainerGradient1stColor,
                                color.AppColor.secondPageContainerGradient2ndColor,
                              ],
                              begin: Alignment.bottomLeft,
                              end:Alignment.topRight,


                            ),
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.timer,
                                size:20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                '68 Mins',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color:color.AppColor.secondPageIconColor,
                                ),
                              )
                            ],
                          ) ,

                        ),
                        SizedBox(width: 20,),
                        Container(
                          height: 30,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors:[
                                color.AppColor.secondPageContainerGradient1stColor,
                                color.AppColor.secondPageContainerGradient2ndColor,
                              ],
                              begin: Alignment.bottomLeft,
                              end:Alignment.topRight,


                            ),
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.handyman_outlined,
                                size:20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                'Resistant Band,Kettle Band',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color:color.AppColor.secondPageIconColor,
                                ),
                              )
                            ],
                          ) ,

                        ),
                      ],


                    ),




                  ],

                ),
              ):Container(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      padding: const EdgeInsets.only(top:50,left: 30,right: 30,),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              debugPrint('tapped');
                            },
                            child:Icon(Icons.arrow_back_ios,
                            size:20,
                            color: color.AppColor.secondPageIconColor,) ,
                          ),
                          Expanded(child: Container()),
                          Icon(Icons.info_outline,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,)
                        ],
                      ),

                    ),
                    _playView(context),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70)
                    )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Row(

                        children: [
                          SizedBox(width: 30,),
                          Text(
                            'Circuit 1: Legs Toning',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                                  fontSize: 20,
                              color: color.AppColor.circuitsColor,

                            ),
                          ),
                          Expanded(child: Container()),
                          Row(
                            children: [
                              Icon(
                                Icons.loop,size: 30,
                                color: color.AppColor.loopColor,
                              ),
                              SizedBox(width: 30,),
                              Text(
                                '3 Sets',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: color.AppColor.setsColor,

                                ),
                              ),
                            ],

                          ),
                          SizedBox(width: 20,),

                        ],

                      ),
                      SizedBox(height: 20,),
                      Expanded(child:_listView()
                      ),

                    ],
                  ),
                ),

              ),
            ],

          ),
    ));
  }

  _ListView(int index){
    return Container(
      height: 135,


      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                        videoinfo[index]["thumbnail"]
                    ),
                    fit: BoxFit.cover,
                  ),
                ),

              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(videoinfo[index]['title'],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(top:5),
                    child: Text(
                      videoinfo[index]['time'],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ],
              )

            ],

          ),
          SizedBox(height: 18,),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius:BorderRadius.circular(10),
                ),

                child: Text(
                  '15s Rest',
                  style: TextStyle(
                      color: Color(0xFF839fed)
                  ),

                ),

              ),
              Row(
                children: [
                  for(int i =0;i<70; i++)
                    i.isEven?Container(
                      width:3 ,
                      height:1,
                      decoration: BoxDecoration(
                        color: Color(0xFF839fed),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ):Container(
                      width:3 ,
                      height:1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),

                ],
              ),
            ],
          ),



        ],
      ),

    );
  }
  _onTapVideo(int index){
    final controller = VideoPlayerController.network(videoinfo[index]['videoUrl']);
    _controller= controller;
    setState(() {
    });
    controller..initialize().then((_){
      controller.play();

      setState(() {

      });
    });

  }
  _listView(){
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal:30,vertical:8),
      itemCount: videoinfo.length ,
      itemBuilder: (_, int index){
        return GestureDetector(
          onTap: (){
            _onTapVideo(index);
            debugPrint(index.toString());
            setState(() {
              if(_playArea==false){
                _playArea=true;
              }

            });
          },
          child:_BuildCard(index),
        );
      },
    );
  }
  _BuildCard(int index){
    return Container(
      height: 135,


      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                        videoinfo[index]["thumbnail"]
                    ),
                    fit: BoxFit.cover,
                  ),
                ),

              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(videoinfo[index]['title'],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(top:5),
                    child: Text(
                      videoinfo[index]['time'],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ],
              )

            ],

          ),
          SizedBox(height: 18,),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius:BorderRadius.circular(10),
                ),

                child: Text(
                  '15s Rest',
                  style: TextStyle(
                      color: Color(0xFF839fed)
                  ),

                ),

              ),
              Row(
                children: [
                  for(int i =0;i<70; i++)
                    i.isEven?Container(
                      width:3 ,
                      height:1,
                      decoration: BoxDecoration(
                        color: Color(0xFF839fed),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ):Container(
                      width:3 ,
                      height:1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),

                ],
              ),
            ],
          ),



        ],
      ),

    );
  }
  Widget _playView(BuildContext context){
    final controller = _controller;
    if(controller!=null&& controller.value.isInitialized){
      return Container(
        height: 300,
        width: 300,
        child: VideoPlayer(controller),
      ) ;
    } else{
      return Text('Being initialized please Wait...');

    }

  }
}
