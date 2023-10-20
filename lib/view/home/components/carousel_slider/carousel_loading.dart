import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarouselLoading extends StatelessWidget {
  const CarouselLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.shade300,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularDot(),
              SizedBox(width: 2),
              CircularDot(),
              SizedBox(width: 2),
              CircularDot(),
              SizedBox(width: 2),
              CircularDot(),
              SizedBox(width: 2),
              CircularDot()
            ],
          )
        ],
      ),
    );
  }
}

class CircularDot extends StatelessWidget {
  const CircularDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
    );
  }
}
