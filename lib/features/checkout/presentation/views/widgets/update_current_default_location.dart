import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/app_regex.dart';
import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_text_field.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:gac/features/checkout/presentation/views/widgets/update_current_government_widget.dart';

class UpdateCurrentDefaultLocation extends StatefulWidget {
  const UpdateCurrentDefaultLocation({
    super.key,
    required this.defaultLocation,
  });

  final bool defaultLocation;

  @override
  State<UpdateCurrentDefaultLocation> createState() =>
      _UpdateCurrentDefaultLocationState();
}

class _UpdateCurrentDefaultLocationState
    extends State<UpdateCurrentDefaultLocation> {
  @override
  Widget build(BuildContext context) {
    bool visibleUpdateAddressFields() {
      if (CacheHelper.getData(key: kSaveUserLocationKey) == null) {
        return true;
      } else {
        if (widget.defaultLocation) {
          return false;
        } else {
          return true;
        }
      }
    }

    return Visibility(
      visible: visibleUpdateAddressFields(),
      child: Column(
        children: [
          verticalSpace(24),
          Visibility(
            visible: getUserData().phoneNumber.isEmpty,
            child: CustomTextFormField(
              needsValidation: true,
              textInputType: TextInputType.phone,
              onChanged: (value) {
                context
                    .read<OrderEntity>()
                    .shippingAddressEntity
                    .customerPhone = value;
              },
              hintText: ' رقم الهاتف',
              validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isPhoneNumberValid(value)) {
                    return 'برجاء ادخال رقم هاتف صالح';
                  }
                  return null;
                },
            ),
          ),
          verticalSpace(24),
          const CustomGovernmentSelector(),
          verticalSpace(16),
          CustomTextFormField(
            needsValidation: true,
            onChanged: (value) {
              context.read<OrderEntity>().shippingAddressEntity.customerCity =
                  value;
            },
            hintText: 'المدينة او القرية',
          ),
          verticalSpace(16),
          CustomTextFormField(
            needsValidation: true,
            onChanged: (value) {
              context
                  .read<OrderEntity>()
                  .shippingAddressEntity
                  .customerStreetName = value;
            },
            hintText: 'اسم الشارع',
          ),
          verticalSpace(16),
          CustomTextFormField(
            needsValidation: false,
            onChanged: (value) {
              context
                  .read<OrderEntity>()
                  .shippingAddressEntity
                  .customerLocationDescription = value;
            },
            hintText: 'وصف المكان  \"اختياري\"',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
