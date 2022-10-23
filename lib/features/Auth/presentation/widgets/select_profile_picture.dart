import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:task_i/core/utilities/colors.dart';
import 'package:task_i/features/Auth/data/datasources/face_vectors.dart';

class SelectProfilePicture extends StatelessWidget {
  const SelectProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30)),
          ),
          AnimationLimiter(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                scrollPhysics: const PageScrollPhysics(),
                enableInfiniteScroll: false,
                height: double.infinity,
                initialPage: 2,
                padEnds: true,
                enlargeCenterPage: true,
                viewportFraction: 0.25,
                onPageChanged: (index, reason) {
                  log(index.toString());
                },
              ),
              itemCount: faceVectors.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return AnimationConfiguration.staggeredList(
                  position: itemIndex,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 100,
                    child: FadeInAnimation(
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          faceVectors[itemIndex],
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
