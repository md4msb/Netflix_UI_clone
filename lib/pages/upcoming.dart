import 'package:flutter/material.dart';
import 'package:netflix/model/model.dart';

class UpComing extends StatefulWidget {
  const UpComing({Key? key}) : super(key: key);

  @override
  _UpComingState createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 75,
                // floating: true,
                snap: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: AppBar(
                    backgroundColor: Colors.transparent,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        Text('Coming Soon'),
                        ListTile(
                          leading: Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Notification',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
                future: getUpComing(),
                builder: (context, snapshot) {
                  Future.delayed(const Duration(seconds: 3), () {});
                  if (snapshot.hasData) {
                    List upComing = snapshot.data as List;
                    return PageView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: upComing.length,
                        // scrollBehavior: const ScrollBehavior(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500' +
                                                upComing[index]
                                                    ['backdrop_path'],
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      color: Colors.black38,
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                upcoming[index]['title'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                upcoming[index]['release_date'],
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                upcoming[index]['overview'],
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 18),
                              ),
                              const Divider(
                                thickness: 1.0,
                                color: Colors.grey,
                              ),
                            ],
                          );
                        });
                  }
                  return Container();
                }),
          ),
        ),
      ),
    );
  }
}
