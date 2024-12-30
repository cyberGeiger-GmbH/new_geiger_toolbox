import 'package:gap/gap.dart';

class Spacing {
  static const double p0 = 0.0;
  static const double p4 = 4.0;
  static const double p8 = 8.0;
  static const double p12 = 12.0;
  static const double p16 = 16.0;
  static const double p22 = 22.0;
  static const double p32 = 32.0;

  //const gap widths
  static const gapW4 = Gap(Spacing.p4);
  static const gapW8 = Gap(Spacing.p8);
  static const gapW12 = Gap(Spacing.p12);
  static const gapW16 = Gap(Spacing.p16);
  static const gapW22 = Gap(Spacing.p22);
  static const gapW32 = Gap(Spacing.p32);

//const gap height
  static const gapH4 = Gap(Spacing.p4);
  static const gapH8 = Gap(Spacing.p8);
  static const gapH12 = Gap(Spacing.p12);
  static const gapH16 = Gap(Spacing.p16);
  static const gapH22 = Gap(Spacing.p22);
  static const gapH32 = Gap(Spacing.p32);

  //don't allow user to create an instance
  Spacing._();
}
