import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/apikey/apikey.dart';

class Tvseries extends StatefulWidget {
  const Tvseries({super.key});

  @override
  State<Tvseries> createState() => _TvseriesState();
}

class _TvseriesState extends State<Tvseries> {
  List<Map<String, dynamic>> populartvseries = [];
  var populartvseriesurl =
      'https://api.themoviedb.org/3/tv/popular?api_key=$apikey';

  Future<void> tvseriesfunction() async {
    var populartvresponse = await http.get(Uri.parse(populartvseriesurl));
    if (populartvresponse.statusCode == 200) {
      var tempdata = jsonDecode(populartvresponse.body);
      var populartvjson = tempdata['results'];
      for (var i = 0; i < populartvjson.length; i++) {
        populartvseries.add({
          "name": populartvjson[i]["name"],
          "poster_path": populartvjson[i]["poster_path"],
          "vote_average": populartvjson[i]["vote_average"],
          "Date": populartvjson[i]["first_air_date"],
          "id": populartvjson[i]["id"],
        });
      }
    } else {
      print(populartvresponse.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tvseriesfunction(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(
              color: Colors.amber.shade400,
            ),
          );
        else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 15, bottom: 40),
                child: Text("popular tv series"),
              ),
              Container(
                height: 250,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: populartvseries.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${populartvseries[index]['poster_path']}'),
                              fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.only(left: 13),
                        width: 170,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
