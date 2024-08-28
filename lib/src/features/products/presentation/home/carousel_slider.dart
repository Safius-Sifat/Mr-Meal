import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../utils/size_config.dart';
import '../../domain/slider.dart';

class CarouselSlider extends ConsumerWidget {
  const CarouselSlider(
      {super.key, required this.value, required this.controller});
  final CarouselController controller;
  final AsyncValue<List<SliderModel>> value;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return value.when(
      data: (sliderList) {
        return CarouselView(
            itemExtent: double.infinity,
            itemSnapping: true,
            controller: controller,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(Sizes.p12)),
            ),
            children: List.generate(
              sliderList.length,
              (index) => Stack(
                children: [
                  CachedNetworkImage(
                    height: SizeConfig.screenHeight * 0.2,
                    width: double.infinity,
                    imageUrl: sliderList[index].image,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Shimmer.fromColors(
                      baseColor: Colors.black26,
                      highlightColor: Colors.black12,
                      child: Container(
                        width: double.infinity,
                        height: SizeConfig.screenHeight * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.black,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).scaffoldBackgroundColor,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Positioned(
                    left: Sizes.p8,
                    top: Sizes.p8,
                    child: Container(
                      padding: const EdgeInsets.all(Sizes.p16),
                      decoration: BoxDecoration(
                        color: neutralColor.withOpacity(0.7),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Sizes.p8),
                        ),
                      ),
                      child: Text(sliderList[index].sliderText,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: Sizes.p12,
                                  )),
                    ),
                  ),
                ],
              ),
            ));
      },
      loading: () => Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.black12,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
        ),
      ),
      error: (error, stackTrace) {
        return Center(child: Text('Error: $error'));
      },
    );
  }
}
