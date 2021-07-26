import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_podcast/main.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({Key? key}) : super(key: key);

  @override
  _PodcastScreenState createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [PlayList(), PlayWidgetDrag()],
      ),
    );
  }
}

class PlayWidgetDrag extends StatefulWidget {
  const PlayWidgetDrag({Key? key}) : super(key: key);

  @override
  _PlayWidgetDragState createState() => _PlayWidgetDragState();
}

class _PlayWidgetDragState extends State<PlayWidgetDrag>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200), value: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    double maxSlide = -(MediaQuery.of(context).size.height - 240);
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, snapshot) {
          return GestureDetector(
              onTap: () {
                print("Tap");
              },
              onVerticalDragUpdate: (DragUpdateDetails dragUpdateDetail) {
                double drag = dragUpdateDetail.primaryDelta! / maxSlide;
                _animationController.value -= drag;
              },
              onVerticalDragEnd: (DragEndDetails dragEndDetails) {
                double drag = dragEndDetails.velocity.pixelsPerSecond.dy /
                    MediaQuery.of(context).size.height;
                _animationController.fling(velocity: drag);
              },
              child: Transform.translate(
                  offset: Offset(
                      0, maxSlide - (_animationController.value * maxSlide)),
                  child: PlayWidget()));
        });
  }
}

class PlayList extends StatefulWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 240),
      color: Color(0xff90A9E6),
      child: ListView(
        children: [
          SearchWidget(),
          PodcastItem(
            isActive: false,
          ),
          PodcastItem(
            isActive: true,
          ),
          PodcastItem(
            isActive: false,
          ),
          PodcastItem(
            isActive: false,
          ),
          PodcastItem(
            isActive: false,
          ),
          PodcastItem(
            isActive: false,
          ),
          PodcastItem(
            isActive: false,
          ),
          PodcastItem(
            isActive: false,
          ),
          PodcastItem(
            isActive: false,
          ),
          PodcastItem(
            isActive: false,
          ),
          PodcastItem(
            isActive: false,
          ),
        ],
      ),
    );
  }
}

class PodcastItem extends StatelessWidget {
  final bool isActive;

  const PodcastItem({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isActive ? Colors.amber : Colors.transparent,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff2B79E2)),
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
              )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Follow Engagement",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        "Mista",
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        "12:00",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PlayWidget extends StatelessWidget {
  const PlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
                  Navigator.pop(context);
                }),
                Spacer(),
                IconButton(icon: Icon(Icons.menu), onPressed: () {})
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              "assets/p1.png",
              height: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Increase Followers",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "243 Open",
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
          Spacer(),
          PlayerControl()
        ],
      ),
    );
  }
}

class PlayerControl extends StatelessWidget {
  const PlayerControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
      height: 200,
      child: Column(
        children: [
          GradientProgressIndicator(
            gradient: Gradients.coldLinear,
            value: 0.7,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [Text("30:05"), Spacer(), Text("1:03:03")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(Icons.volume_down_outlined),
                Spacer(),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffD5DFF1)),
                    child: Icon(
                      Icons.play_arrow,
                      color: Color(0xff2B79E2),
                    )),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffD5DFF1)),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xff2C7AE4), Color(0xff71A5EB)])),
                      child: Icon(
                        Icons.play_circle_fill,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                Spacer(),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffD5DFF1)),
                    child: Icon(
                      Icons.play_arrow,
                      color: Color(0xff2B79E2),
                    )),
                Spacer(),
                Icon(Icons.favorite),
              ],
            ),
          ),
          Spacer(),
          Text(
            "All PODCAST",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
