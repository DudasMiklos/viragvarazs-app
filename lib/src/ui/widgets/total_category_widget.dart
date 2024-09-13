import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viragvarazs/src/models/totalCategory/total_category_model.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';

class TotalCategoryWidget extends StatelessWidget {
  final TotalCategoryModel totalCategory;
  const TotalCategoryWidget({super.key, required this.totalCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ApplicationStyle.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ApplicationStyle.primaryColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: CachedNetworkImage(
                imageUrl: totalCategory.imageUrl,
                fit: BoxFit.cover,
                //height: MediaQuery.of(context).size.width * 0.55,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: ApplicationStyle.primaryColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error_outline,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            //width: MediaQuery.of(context).size.width * 0.30,
            child: Center(
              child: Text(
                totalCategory.name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: ApplicationStyle.darkColor, fontSize: 15),
                maxLines: 2,
              ),
            ),
          ),
          const Divider(
            height: 11,
          ),
          SizedBox(
            //width: MediaQuery.of(context).size.width * 0.30,
            child: Center(
              child: Text(
                "${totalCategory.availableProductsCount} db aktív termék",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: totalCategory.availableProductsCount == 0
                          ? ApplicationStyle.redColor
                          : ApplicationStyle.darkColor,
                      fontSize: 12,
                    ),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
