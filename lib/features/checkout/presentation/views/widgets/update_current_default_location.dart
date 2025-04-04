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
import 'package:gac/generated/l10n.dart';

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
              hintText:  S.of(context).phone_number,
              validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isPhoneNumberValid(value)) {
                    return S.of(context).phone_number_validation;
                  }
                  return null;
                },
            ),
          ),
          verticalSpace(24),
          const CustomGovernmentSelector(),
          verticalSpace(16),
          CustomTextFormField(
             textInputType: TextInputType.text,
            needsValidation: true,
            onChanged: (value) {
              context.read<OrderEntity>().shippingAddressEntity.customerCity =
                  value;
            },
            hintText:  S.of(context).city_hint,
          ),
          verticalSpace(16),
          CustomTextFormField(
             textInputType: TextInputType.text,
            needsValidation: true,
            onChanged: (value) {
              context
                  .read<OrderEntity>()
                  .shippingAddressEntity
                  .customerStreetName = value;
            },
            hintText: S.of(context).street_hint,
          ),
          verticalSpace(16),
          CustomTextFormField(
             textInputType: TextInputType.text,
            needsValidation: false,
            onChanged: (value) {
              context
                  .read<OrderEntity>()
                  .shippingAddressEntity
                  .customerLocationDescription = value;
            },
            hintText:  S.of(context).address_description_hint,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
