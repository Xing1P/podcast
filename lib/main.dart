import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_podcast/podcast_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1976DF),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Podcast.",
              style: TextStyle(
                  color: Colors.amber, fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          SearchWidget(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "Let grow up with podcast",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DiscoverCard(
                  image: "assets/p1.png",
                  title: "Startup",
                  tag: "For You",
                  color: Colors.pink,
                ),
                DiscoverCard(
                  image: "assets/p2.png",
                  title: "Entertainment",
                  tag: "New",
                  color: Colors.blue,
                ),
                DiscoverCard(
                  image: "assets/p3.png",
                  title: "Social Media",
                  tag: "Editor Choice",
                  color: Colors.amber,
                ),
                DiscoverCard(
                  image: "assets/p1.png",
                  title: "Startup",
                  tag: "For You",
                  color: Colors.pink,
                ),
                DiscoverCard(
                  image: "assets/p2.png",
                  title: "Entertainment",
                  tag: "New",
                  color: Colors.blue,
                ),
                DiscoverCard(
                  image: "assets/p3.png",
                  title: "Social Media",
                  tag: "Editor Choice",
                  color: Colors.amber,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "History",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          HistoryCard(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            MenuItem(
              iconData: Icons.home_outlined,
            ),
            MenuItem(
              iconData: Icons.favorite_border,
            ),
            MainMenu(),
            MenuItem(
              iconData: Icons.save_alt,
            ),
            MenuItem(
              iconData: Icons.account_circle_outlined,
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.amber),
        child: Icon(Icons.mic),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData iconData;

  const MenuItem({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Icon(iconData),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.5)),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
              hintText: "Search",
              suffixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}

class DiscoverCard extends StatelessWidget {
  final String image;
  final String title;
  final String tag;
  final Color color;

  const DiscoverCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.tag,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color.withOpacity(0.8)),
              child: Text(
                tag,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PodcastScreen()));
              },
              child: Container(
                height: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/p1.png",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "June 15 2021",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Increase Follower",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber),
                              child: Text(
                                "Social Media",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.3,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.playlist_add,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
