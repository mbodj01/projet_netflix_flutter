import 'package:flutter/material.dart';

Widget sliderlist(
    List firstlistname, String categorytitle, String type, int itemcount) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 15, bottom: 40),
        child: Text(categorytitle.toString()),
      ),
      Container(
        height: 250,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: itemcount,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print(firstlistname[index]['id']);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken),
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${firstlistname[index]['poster_path']}'),
                      fit: BoxFit.cover),
                ),
                margin: EdgeInsets.only(left: 13),
                width: 170,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 6),
                      child: Text(firstlistname[index]['Date']),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 6),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 2,
                            bottom: 2,
                            left: 5,
                            right: 5,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              SizedBox(width: 2),
                              Text(firstlistname[index]['vote_average']
                                  .toString())
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
