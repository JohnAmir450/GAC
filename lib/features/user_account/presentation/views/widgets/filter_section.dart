import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:gac/generated/l10n.dart';

class FilterSection extends StatefulWidget {
  final String defaultStatus; // Pass a default status value

  const FilterSection({
    super.key,
    this.defaultStatus = 'الكل', // Default is 'All' if no value is passed
  });

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  late String selectedStatus; // Holds the current selected status

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.defaultStatus; // Initialize with the default status
  }

  @override
  Widget build(BuildContext context) {
    var locale= S.of(context);
    return Row(
      children: [
         Text(
          '${locale.status}: ',
          style: TextStyles.semiBold16,
        ),
        horizontalSpace(8),
        DropdownButton<String>(
          value: selectedStatus,
          items:  [
            DropdownMenuItem(
              value: 'الكل',
              child: Text(
                locale.all,
                style: TextStyles.semiBold16,
              ),
            ),
            DropdownMenuItem(
              value: 'جاري التأكيد',
              child: Text(
               locale.in_progress,
                style: TextStyles.semiBold16,
              ),
            ),
            DropdownMenuItem(
              value: 'تم الإلغاء',
              child: Text(
               locale.cancelled,
                style: TextStyles.semiBold16,
              ),
            ),
            DropdownMenuItem(
              value: 'تم التأكيد',
              child: Text(
               locale.confirmed,
                style: TextStyles.semiBold16,
              ),
            ),
            DropdownMenuItem(
              value: 'خرج للتوصيل',
              child: Text(
               locale.out_for_delivery,
                style: TextStyles.semiBold16,
              ),
            ),
            DropdownMenuItem(
              value: 'تم الاستلام',
              child: Text(
               locale.delivered,
                style: TextStyles.semiBold16,
              ),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedStatus = value; // Update the selected status
              });

              // Fetch filtered orders based on the selected status
              context.read<AccountManagerCubit>().fetchUserOrders(query: {
                if (value != 'الكل') 'where': 'orderStatus',
                if (value != 'الكل') 'isEqualTo': value,
                'orderBy': 'orderDate',
                'descending': true,
              });
            }
          },
        ),
      ],
    );
  }
}