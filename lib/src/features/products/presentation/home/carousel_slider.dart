import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../common_widgets/error_message_widget.dart';
import '../../../../common_widgets/network_photo.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
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
      skipLoadingOnRefresh: false,
      data: (sliderList) {
        if (sliderList.isEmpty) {
          return Container();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider.builder(
                carouselController: _controller,
                options: CarouselOptions(
                    // height: SizeConfig.screenHeight * 0.2,
                    viewportFraction: 1,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                itemCount: sliderList.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Sizes.p12),
                          child: SizedBox(
                              width: double.infinity,
                              child: NetworkPhoto(sliderList[index].image)),
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
                            child: Text(
                                sliderList[index].sliderText ?? '20% off now',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: Sizes.p12,
                                    )),
                          ),
                        ),
                      ],
                    ),
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
      loading: () => Skeletonizer(
        child: Column(
          children: [
            Skeleton.leaf(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            gapH16,
          ],
        ),
      ),
      error: (error, stackTrace) {
        return ErrorMessageWidget(error);
      },
    );
  }
}
