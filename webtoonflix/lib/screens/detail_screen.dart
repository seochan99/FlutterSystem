import 'package:flutter/material.dart';
import 'package:webtoonflix/models/webtoon_detail_model.dart';
import 'package:webtoonflix/models/webtoon_episode_model.dart';
import 'package:webtoonflix/services/api_service.dart';

// 어떤 디테일을 클릭했는지를 받아야함
class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 250,
                      // clipBehavior: 이미지를 컨테이너에 맞게 잘라줌
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        // borderRadius: 컨테이너의 모서리를 둥글게 만들어줌
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: 그림자 효과
                        boxShadow: [
                          BoxShadow(
                            // color: 그림자 색상
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 15,
                            // offset: 그림자 위치
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.network(widget.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${snapshot.data!.genre} / ${snapshot.data!.age}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text("...");
                },
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // 어떻게 렌더링 할지
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green.shade400,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: const Offset(2, 2),
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      episode.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ))
                      ],
                    );
                  }
                  return Container(); // 아무것도 없을때
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
