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
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              // separtorBuilder: 구분자를 만들어주는 위젯
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
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
}
