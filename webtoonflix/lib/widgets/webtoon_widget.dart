import 'package:flutter/material.dart';
import 'package:webtoonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                title: title,
                thumb: thumb,
                id: id,
              ),
              fullscreenDialog: true,
            ));
      },
      child: Column(
        children: [
          //image
          // container를 사용하는 이유는 decoration을 사용할 예정이기 때문
          Hero(
            tag: id,
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
              child: Image.network(thumb),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
