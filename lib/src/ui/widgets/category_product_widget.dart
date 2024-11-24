import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viragvarazs/src/models/product/product_model.dart';
import 'package:viragvarazs/src/resources/routes/app_routes.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:viragvarazs/src/ui/widgets/custom_small_elevated_button.dart';

class CategoryProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const CategoryProductWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: ApplicationStyle.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ApplicationStyle.primaryColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.41,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: CachedNetworkImage(
                      imageUrl: productModel.imageUrl,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
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
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: Text(
                          productModel.name,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ApplicationStyle.darkColor,
                                  ),
                          maxLines: 2,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productModel.availableOptionCount == 0
                                ? "Látható (0)"
                                : "Látható (${productModel.availableOptionCount})",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: productModel.availableOptionCount == 0
                                      ? ApplicationStyle.redColor
                                      : ApplicationStyle.greenColor,
                                  fontSize: 12.5,
                                ),
                          ),
                          Text(
                            productModel.stockOptionCount == 0
                                ? "Raktáron (0)"
                                : "Raktáron (${productModel.stockOptionCount})",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: productModel.stockOptionCount == 0
                                      ? ApplicationStyle.redColor
                                      : ApplicationStyle.greenColor,
                                  fontSize: 12.5,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "${productModel.totalTimesSold}x eladva",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ApplicationStyle.darkColor, fontSize: 12.5),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "${productModel.totalOptionCount} opció (${productModel.availableOptionCount} látható, ${productModel.stockOptionCount} raktáron)",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ApplicationStyle.darkColor, fontSize: 12.5),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 14.0,
                      ),
                      child: Text(
                        productModel.minPrice == productModel.maxPrice
                            ? productModel.formattedMinPrice()
                            : "${productModel.formattedMinPrice()} - ${productModel.formattedMaxPrice()}",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: ApplicationStyle.darkColor,
                              fontSize: 16,
                            ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Center(
                    child: CustomSmallElevatedButton(
                      onTap: () {
                        AutoRouter.of(context).push(
                          ProductRoute(
                            product: productModel,
                          ),
                        );
                      },
                      title: "Részletek",
                      height: 26,
                      backgroundColor: ApplicationStyle.primaryColor,
                      width: 150,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
