import 'package:douban_movie_flutter/Component/HeaderWithArrow.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:flutter/material.dart';


class CastListView extends StatelessWidget {

  const CastListView(
    this.movieDetailData,{
    Key key,
  }):super(key:key);

  final MovieDetailData movieDetailData;
  List<Person> get persons {
    List<Person> list = List();
    list.add(this.movieDetailData.directors[0]);
    list.addAll(this.movieDetailData.casts);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16.0,right: 16.0,top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithArrow(title: '演职表',subTitle: '全部${this.persons.length}人',),
          Container(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: this.persons.length,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage.assetNetwork(
                          width: 80,
                          height: 120,
                          placeholder: 'images/image_placeholder.png',
                          image: this.persons[index].avatars.small,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text('${this.persons[index].name}',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}