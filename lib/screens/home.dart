import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qbhlthtest/screens/playvideo.dart';
import 'package:qbhlthtest/screens/third.dart';

import '../services/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    getData();
    getYoutubeThumbnail();
  }

  getData() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => _controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(CupertinoIcons.back),
                            onPressed: () {
                              Get.to(() => ThirdScreen());
                            },
                          ),
                          const Align(
                              alignment: Alignment.center,
                              child: Text("Your Feelings History",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))),
                        ],
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text("Your feelings from last 30 days",
                                style: TextStyle(fontSize: 15)),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _controller.model.value.data?.feelingPercentage
                                        ?.energetic ==
                                    '0'
                                ? Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(50),
                                            bottomRight: Radius.circular(50),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12
                                                  .withOpacity(0.15),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: const Offset(1, 0),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                      text: _controller
                                                              .model
                                                              .value
                                                              .data
                                                              ?.feelingPercentage
                                                              ?.energetic ??
                                                          ' ',
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.black54)),
                                                  const TextSpan(
                                                      text: '%',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black54)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF85C454),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: const Text(
                                                '⚡',
                                                style: TextStyle(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        'Energetic',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )
                                : Opacity(
                                    opacity: 0.3,
                                    child: Column(
                                      children: [
                                        const Text(' '),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF85C454),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: const Text(
                                            '⚡',
                                            style: TextStyle(),
                                          ),
                                        ),
                                        const Text(
                                          'Energetic',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                            _controller.model.value.data?.feelingPercentage
                                        ?.sad !=
                                    '0'
                                ? Column(
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: _controller
                                                        .model
                                                        .value
                                                        .data
                                                        ?.feelingPercentage
                                                        ?.sad ??
                                                    ' ',
                                                style: const TextStyle(
                                                    color: Colors.black54)),
                                            const TextSpan(
                                                text: '%',
                                                style: TextStyle(
                                                    color: Colors.black54)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF85C454),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: const Text(
                                          '😪',
                                          style: TextStyle(),
                                        ),
                                      ),
                                      const Text(
                                        'Sad',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )
                                : Opacity(
                                    opacity: 0.3,
                                    child: Column(
                                      children: [
                                        const Text(' '),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF85C454),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: const Text(
                                            '😪',
                                            style: TextStyle(),
                                          ),
                                        ),
                                        const Text(
                                          'Sad',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                            _controller.model.value.data?.feelingPercentage
                                        ?.happy !=
                                    '0'
                                ? Column(
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: _controller
                                                        .model
                                                        .value
                                                        .data
                                                        ?.feelingPercentage
                                                        ?.happy ??
                                                    ' ',
                                                style: const TextStyle(
                                                    color: Colors.black54)),
                                            const TextSpan(
                                                text: '%',
                                                style: TextStyle(
                                                    color: Colors.black54)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF85C454),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: const Text(
                                          '😪',
                                          style: TextStyle(),
                                        ),
                                      ),
                                      const Text(
                                        'Happy',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )
                                : Opacity(
                                    opacity: 0.3,
                                    child: Column(
                                      children: [
                                        const Text(' '),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF85C454),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: const Text(
                                            '😪',
                                            style: TextStyle(),
                                          ),
                                        ),
                                        const Text(
                                          'Happy',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                            _controller.model.value.data?.feelingPercentage
                                        ?.angry !=
                                    '0'
                                ? Column(
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: _controller
                                                        .model
                                                        .value
                                                        .data
                                                        ?.feelingPercentage
                                                        ?.angry ??
                                                    ' ',
                                                style: const TextStyle(
                                                    color: Colors.black54)),
                                            const TextSpan(
                                                text: '%',
                                                style: TextStyle(
                                                    color: Colors.black54)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF85C454),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: const Text(
                                          '😡',
                                          style: TextStyle(),
                                        ),
                                      ),
                                      const Text(
                                        'Angry',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )
                                : Opacity(
                                    opacity: 0.3,
                                    child: Column(
                                      children: [
                                        const Text(' '),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF85C454),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: const Text(
                                            '😡',
                                            style: TextStyle(),
                                          ),
                                        ),
                                        const Text(
                                          'Angry',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                            _controller.model.value.data?.feelingPercentage
                                        ?.calm !=
                                    '0'
                                ? Column(
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: _controller
                                                        .model
                                                        .value
                                                        .data
                                                        ?.feelingPercentage
                                                        ?.calm ??
                                                    ' ',
                                                style: const TextStyle(
                                                    color: Colors.black54)),
                                            const TextSpan(
                                                text: '%',
                                                style: TextStyle(
                                                    color: Colors.black54)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF85C454),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: const Text(
                                          '🌿',
                                          style: TextStyle(),
                                        ),
                                      ),
                                      const Text(
                                        'Calm',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )
                                : Opacity(
                                    opacity: 0.3,
                                    child: Column(
                                      children: [
                                        const Text(' '),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF85C454),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: const Text(
                                            '🌿',
                                            style: TextStyle(),
                                          ),
                                        ),
                                        const Text(
                                          'Calm',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                            _controller.model.value.data?.feelingPercentage
                                        ?.bored !=
                                    '0'
                                ? Column(
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: _controller
                                                        .model
                                                        .value
                                                        .data
                                                        ?.feelingPercentage
                                                        ?.bored ??
                                                    ' ',
                                                style: const TextStyle(
                                                    color: Colors.black54)),
                                            const TextSpan(
                                                text: '%',
                                                style: TextStyle(
                                                    color: Colors.black54)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF85C454),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: const Text(
                                          '😩',
                                          style: TextStyle(),
                                        ),
                                      ),
                                      const Text(
                                        'Bored',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )
                                : Opacity(
                                    opacity: 0.3,
                                    child: Column(
                                      children: [
                                        const Text(' '),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 10, 0, 10),
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF85C454),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: const Text(
                                            '😩',
                                            style: TextStyle(),
                                          ),
                                        ),
                                        const Text(
                                          'Bored',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black26,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xFFC6E5F7),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Text('10 Jun, 2021',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 0, right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              decoration: BoxDecoration(
                                color: Colors.black87.withOpacity(0.65),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 65,
                              width: 35,
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      'Mo',
                                      style: TextStyle(
                                          color: Colors.white30, fontSize: 16),
                                    ),
                                  ),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                        color: Colors.white38, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              decoration: BoxDecoration(
                                // color: Colors.black87.withOpacity(0.65),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 65,
                              width: 35,
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      'Tu',
                                      style: TextStyle(
                                          color: Colors.black12, fontSize: 16),
                                    ),
                                  ),
                                  Text(
                                    '11',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              decoration: BoxDecoration(
                                // color: Colors.black87.withOpacity(0.65),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 65,
                              width: 35,
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      'We',
                                      style: TextStyle(
                                          color: Colors.black12, fontSize: 16),
                                    ),
                                  ),
                                  Text(
                                    '12',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              decoration: BoxDecoration(
                                // color: Colors.black87.withOpacity(0.65),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 65,
                              width: 35,
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      'Th',
                                      style: TextStyle(
                                          color: Colors.black12, fontSize: 16),
                                    ),
                                  ),
                                  Text(
                                    '13',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              decoration: BoxDecoration(
                                // color: Colors.black87.withOpacity(0.65),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 65,
                              width: 35,
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      'Fr',
                                      style: TextStyle(
                                          color: Colors.black12, fontSize: 16),
                                    ),
                                  ),
                                  Text(
                                    '14',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              decoration: BoxDecoration(
                                // color: Colors.black87.withOpacity(0.65),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 65,
                              width: 35,
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      'Sa',
                                      style: TextStyle(
                                          color: Colors.black12, fontSize: 16),
                                    ),
                                  ),
                                  Text(
                                    '15',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              decoration: BoxDecoration(
                                // color: Colors.black87.withOpacity(0.65),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 65,
                              width: 35,
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      'Su',
                                      style: TextStyle(
                                          color: Colors.black12, fontSize: 16),
                                    ),
                                  ),
                                  Text(
                                    '16',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black26,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: const [
                                Text("9 AM - 12PM"),
                                SizedBox(width: 35),
                                Text('🌿 Calm'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: const [
                                Text("1 PM - 4PM"),
                                SizedBox(width: 40),
                                Text('🌿 Calm'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: const [
                                Text("4 PM - 6PM"),
                                SizedBox(width: 40),
                                Text('😡 Angry'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black12,
                      ),
                      Obx(() {
                        return Column(
                          children: [
                            const Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  child: Text(
                                    'You May Find This Interesting',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  _controller.model.value.data?.videoArr?[0]
                                          .description ??
                                      '',
                                  style: const TextStyle(
                                      color: Colors.black45, height: 1.3)),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.3,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(2, (int index) {
                                  return Stack(children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        nextPage();
                                      },
                                      child: GestureDetector(
                                        onTap: () {
                                          nextPage();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 15, 0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Image(
                                                  image: NetworkImage(
                                                      getYoutubeThumbnail()),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.width *
                                          0.11,
                                      right: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(() => const PlayVideo(),
                                              arguments: [
                                                {
                                                  "video": _controller
                                                      .model
                                                      .value
                                                      .data
                                                      ?.videoArr?[0]
                                                      .youtubeUrl,
                                                  "title": _controller
                                                      .model
                                                      .value
                                                      .data
                                                      ?.videoArr?[0]
                                                      .title,
                                                  "description": _controller
                                                      .model
                                                      .value
                                                      .data
                                                      ?.videoArr?[0]
                                                      .description
                                                },
                                              ]);
                                        },
                                        child: Container(
                                            width: 40,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.play_arrow,
                                              size: 25,
                                              color:
                                                  Colors.white.withOpacity(1.0),
                                            ))),
                                      ),
                                    ),
                                  ]);
                                }),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  String getYoutubeThumbnail() {
    String videoUrl =
        _controller.model.value.data?.videoArr?[0].youtubeUrl ?? ' ';
    final Uri? uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return ' ';
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }

  void nextPage() {
    Get.to(() => const PlayVideo(), arguments: [
      {
        "videoId": getYoutubeThumbnail(),
        "video": _controller.model.value.data?.videoArr?[0].youtubeUrl,
        "title": _controller.model.value.data?.videoArr?[0].title,
        "description": _controller.model.value.data?.videoArr?[0].description
      },
    ]);
  }
}
