import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:loading_overlay/loading_overlay.dart';
import 'package:nedusoft/Utils/custom_snackbar.dart';
import 'package:nedusoft/main.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:stacked/stacked.dart';
import '../../../Utils/Colors.dart';
import 'chapter_video_model.dart';

class ChapterVideo extends StatelessWidget {
  String chapterId;
  ChapterVideo({required this.chapterId});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) async => await viewModel.init(chapterId),
        viewModelBuilder: () => ChapterVideoViewModel(),
        builder: (con, model, child) => LoadingOverlay(
              isLoading: model.isBusy,
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              opacity: 0.5,
              child: Scaffold(
                  appBar: PreferredSize(
                      preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
                      child: AppBar(
                        backgroundColor: primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(24),
                          ),
                        ),
                        title: Text(
                          "Chapter Videos",
                          style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  backgroundColor: WhiteColor,
                  body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const SizedBox(
                      height: 12,
                    ),
                    model.isBusy
                        ? const SizedBox()
                        : model.chapterVideosModel!.list!.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(vertical: 40),
                                child: Center(
                                  child: Text(
                                    "No Videos Available",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14, color: primaryColor, fontFamily: "Gilroy Bold"),
                                  ),
                                ))
                            : Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: model.chapterVideosModel!.list!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    var spl = model.chapterVideosModel!.list![index].link!.split("/");
                                    log(spl.toList().toString());
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: InkWell(
                                          onTap: () {
                                            if (spl.contains("www.youtube.com")) {
                                              model.navigateToVideo(spl.last);
                                            } else {
                                              showCustomSnackbar(msg: "Wrong YouTube Link", type: SnackbarType.failure);
                                            }
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                                            padding: const EdgeInsets.all(10.0),
                                            height: 140.0,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(0, 1),
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Stack(
                                                  children: [
                                                    spl.contains("www.youtube.com")
                                                        ? CachedNetworkImage(
                                                            width: 150.0,
                                                            imageUrl: "https://img.youtube.com/vi/${spl.last}/0.jpg",
                                                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                                          )
                                                        : const SizedBox(
                                                            width: 150,
                                                            child: Center(
                                                              child: Icon(
                                                                Icons.image_not_supported,
                                                              ),
                                                            ),
                                                          ),
                                                    Positioned.fill(
                                                        child: Align(
                                                      alignment: Alignment.center,
                                                      child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                                          child: Icon(
                                                            Icons.play_arrow,
                                                            color: Colors.black.withOpacity(0.7),
                                                          )),
                                                    ))
                                                  ],
                                                ),
                                                const SizedBox(width: 10.0),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        model.chapterVideosModel!.list![index].chapter ?? "Chapter",
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 12,
                                                      ),
                                                      Text(
                                                        model.chapterVideosModel!.list![index].subject ?? "Subject ",
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                        ),
                                                      ),
                                                      model.chapterVideosModel!.list![index].fileName == null
                                                          ? const SizedBox()
                                                          : InkWell(
                                                              onTap: () async {
                                                                await model.getSynopsis(model.chapterVideosModel!.list![index].topicId.toString());
                                                              },
                                                              child: Container(
                                                                margin: const EdgeInsets.only(top: 12),
                                                                height: 30,
                                                                decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(5)),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Download Synopsis File",
                                                                    style: TextStyle(fontFamily: "Gilroy Medium", fontSize: 12, color: WhiteColor),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ),
                  ])),
            ));
  }
}

class VideoScreen extends StatefulWidget {
  final String? id;

  VideoScreen({this.id});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id!,
      flags: const YoutubePlayerFlags(mute: false, autoPlay: true, hideThumbnail: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).orientation == Orientation.landscape
          ? null
          : PreferredSize(
              preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
              child: AppBar(
                backgroundColor: primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                title: Text(
                  "Chapter Video",
                  style: TextStyle(fontSize: 18, fontFamily: "Gilroy Medium", color: WhiteColor),
                  overflow: TextOverflow.ellipsis,
                ),
              )),
      backgroundColor: WhiteColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: YoutubePlayer(
          controller: _controller!,
          showVideoProgressIndicator: true,
          onReady: () {
            print('Player is ready.');
          },
        ),
      ),
    );
  }
}
