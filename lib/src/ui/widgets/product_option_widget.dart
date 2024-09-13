import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:viragvarazs/src/models/option/option_model.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:viragvarazs/src/ui/widgets/custom_small_outlined_button.dart';

class ProductOptionWidget extends StatelessWidget {
  final OptionModel optionModel;
  final Function(int) onAvailableChanged;
  final Function(int) onStockChanged;
  final void Function() onEdit;
  const ProductOptionWidget(
      {super.key,
      required this.optionModel,
      required this.onAvailableChanged,
      required this.onStockChanged,
      required this.onEdit});

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
      child: Column(
        children: [
          Text(
            "${optionModel.color.name} · ${optionModel.size.name} · ${optionModel.sku}",
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          Text(
            optionModel.formattedPrice(),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdvancedSwitch(
                  initialValue: optionModel.available == 1,
                  activeColor: ApplicationStyle.primaryColor,
                  inactiveColor: ApplicationStyle.primaryColor.withOpacity(0.3),
                  activeChild: const Text("Megjelenik"),
                  inactiveChild: Text(
                    "Nem látható",
                    style: TextStyle(
                        color: ApplicationStyle.darkColor.withOpacity(0.9)),
                  ),
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: 30,
                  borderRadius: BorderRadius.circular(30),
                  onChanged: (value) {
                    onAvailableChanged(value ? 1 : 0);
                  },
                ),
                CustomSmallOutlinedButton(
                  onTap: () {
                    onEdit();
                  },
                  title: 'Szerkeszt',
                  height: 24,
                  width: 110,
                  foregroundColor: ApplicationStyle.primaryColor,
                ),
                AdvancedSwitch(
                  initialValue: optionModel.stock == 1,
                  activeColor: ApplicationStyle.primaryColor,
                  inactiveColor: ApplicationStyle.primaryColor.withOpacity(0.3),
                  activeChild: const Text("Raktáron"),
                  inactiveChild: Text(
                    "3-4 nap",
                    style: TextStyle(
                        color: ApplicationStyle.darkColor.withOpacity(0.9)),
                  ),
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: 30,
                  borderRadius: BorderRadius.circular(30),
                  onChanged: (value) {
                    onStockChanged(value ? 1 : 0);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
