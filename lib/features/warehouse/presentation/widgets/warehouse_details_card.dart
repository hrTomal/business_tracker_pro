import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:flutter/material.dart';

class WarehouseDetailsCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String? description;
  const WarehouseDetailsCardWidget(
      {super.key, this.imageUrl, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    return Card(
      child: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: dimensions.screenWidth * .3,
                  child: AspectRatio(
                    aspectRatio: 1.1,
                    child: Image.network(
                      imageUrl ?? '', //Todo - change to a default image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const FixedSizedBox(),
            const Divider(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.map_rounded,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
