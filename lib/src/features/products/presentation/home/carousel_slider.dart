import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../utils/size_config.dart';
import '../../domain/slider.dart';

class CustomCarouselSlider extends ConsumerStatefulWidget {
  const CustomCarouselSlider({required this.value, super.key});

  final AsyncValue<List<SliderModel>> value;
  @override
  ConsumerState<CustomCarouselSlider> createState() =>
      _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends ConsumerState<CustomCarouselSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return widget.value.when(
      data: (sliderList) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider.builder(
                carouselController: _controller,
                options: CarouselOptions(
                    height: SizeConfig.screenHeight * 0.2,
                    viewportFraction: 1,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                itemCount: sliderList.length,
                itemBuilder: (context, index, realIndex) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.p12),
                        child: CachedNetworkImage(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: Sizes.p12,
                                  )),
                        ),
                      ),
                    ],
                  );
                }),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sliderList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? primaryColor
                            : secondaryColor,
                      ),
                    ),
                  );
                }).toList())
          ],
        );
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
