import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/text_styles.dart';

class LikelihoodCard extends StatelessWidget {
  const LikelihoodCard({super.key, required this.selectedValue, required this.onSelectValue});

  final int selectedValue;
  final ValueChanged<int> onSelectValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: LightPalette.mint),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Likelihood to Recommend',
                style: TextStyles.body2.copyWith(
                  fontWeight: FontWeight.w700,
                  color: LightPalette.primaryColor,
                ),
              ),
              Text(
                '10/10 Highly Likely',
                style: TextStyles.caption1.copyWith(
                  fontWeight: FontWeight.w700,
                  color: LightPalette.secondaryColor,
                ),
              ),
            ],
          ),
          const Gap(12),
          Row(
            children: List.generate(10, (index) {
              final num = index + 1;
              final isSelected = num == selectedValue;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: num == 10 ? 0 : 4),
                  child: InkWell(
                    onTap: () => onSelectValue(num),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? LightPalette.primaryColor : LightPalette.mintTint,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? LightPalette.primaryColor
                              : LightPalette.onPrimaryColor,
                        ),
                      ),
                      child: Text(
                        '$num',
                        style: TextStyles.caption1.copyWith(
                          fontWeight: FontWeight.w700,
                          color: isSelected ? Colors.white : LightPalette.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
