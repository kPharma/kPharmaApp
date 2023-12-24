import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';

class KBrandTitleText extends StatelessWidget {
  const KBrandTitleText({
    super.key,
    this.color,
    this.maxLines = 1,
    required this.title,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TexKSizes.small,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TexKSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      // Check which brandSize is required and set that style.
      style: brandTextSize == TexKSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TexKSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSize == TexKSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
