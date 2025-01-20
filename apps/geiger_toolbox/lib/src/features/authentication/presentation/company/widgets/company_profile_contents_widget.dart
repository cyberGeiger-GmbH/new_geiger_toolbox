import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/company.dart';

import 'package:geiger_toolbox/src/features/authentication/presentation/company/widgets/company_profile_form_widget.dart';

class CompanyProfileContentsWidget extends ConsumerWidget {
  const CompanyProfileContentsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamUser = ref.watch(watchCompanyProvider);

    return AsyncValueWidget<Company?>(
      value: streamUser,
      data: (userData) => CompanyProfileFormWidget(
        companyData: userData,
      ),
    );
  }
}
