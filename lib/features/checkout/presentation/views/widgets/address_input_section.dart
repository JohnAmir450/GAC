import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/checkout/presentation/views/widgets/default_user_location.dart';
import 'package:gac/features/checkout/presentation/views/widgets/update_current_default_location.dart';

class AddressInputSection extends StatefulWidget {
  const AddressInputSection(
      {super.key,
      required this.formKey,
      required this.autoValidateMode,
      this.defaultLocation = true});
  final GlobalKey<FormState> formKey;
  final bool defaultLocation;
  final ValueNotifier<AutovalidateMode> autoValidateMode;

  @override
  State<AddressInputSection> createState() => _AddressInputSectionState();
}

class _AddressInputSectionState extends State<AddressInputSection> {
  late bool isDefaultLocation;

  @override
  void initState() {
    isDefaultLocation = widget.defaultLocation;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: widget.autoValidateMode,
        builder: (context, value, child) => Form(
          key: widget.formKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DefaultUserLocationWidget(),
              verticalSpace(16),
              GestureDetector(
                  onTap: () {
                    isDefaultLocation = !isDefaultLocation;
                    setState(() {});
                  },
                  child:CacheHelper.getData(key: kSaveUserLocationKey)==null?   Text('اضف عنوان جديد',style: TextStyles.bold16,):Text(
                    isDefaultLocation
                        ? 'اضف عنوان جديد'
                        : 'استخدم العنوان الافتراضي',
                    style: TextStyles.bold16,
                  )),
              UpdateCurrentDefaultLocation(
                defaultLocation: isDefaultLocation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
