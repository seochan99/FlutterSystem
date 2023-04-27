import 'package:flutter/material.dart';
import 'package:webtoonflix/models/webtoon_model.dart';
import 'package:webtoonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          // 스냅샵 데이터가 있는지 확인
          if (snapshot.hasData) {
            // 많은 양 데이터 보여주고 싶을때 ListView사용
            // listView길이를 몰라서 에러가 발생함
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                //expanded: 위젯이 차지할 수 있는 최대 영역을 차지하도록 함
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          // 스냅샵 데이터가 없으면 아래 출력
          return const Center(
            // CircularProgressIndicator: 로딩 중임을 알려주는 위젯
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            //image
            // container를 사용하는 이유는 decoration을 사용할 예정이기 때문
            Container(
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
              child: Image.network(webtoon.thumb),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              webtoon.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
      // separtorBuilder: 구분자를 만들어주는 위젯
      separatorBuilder: (context, index) {
        return const SizedBox(width: 40);
      },
    );
  }
}
