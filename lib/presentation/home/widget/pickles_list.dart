import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/model/icons_model.dart';

class PicklesList extends StatelessWidget {
  const PicklesList({super.key, required this.iconsModel});
  final PickleIconsModel iconsModel;

  @override
  Widget build(BuildContext context) {
    final List<PickleIcon> iconsData = iconsModel.pickleIcons ?? [];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: ClipPath(
          clipBehavior: Clip.none,
          child: Row(
            children: List.generate(
              iconsData.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        child: SizedBox(
                          height: 80,
                          child: Image.asset(
                            iconsData[index].imgUrl ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        iconsData[index].title ?? "",
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyle?.headlineMedium?.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
