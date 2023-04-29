import 'package:flutter/material.dart';

// 어떤 디테일을 클릭했는지를 받아야함
class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            ],
          ),
        ],
      ),
    );
  }
}
