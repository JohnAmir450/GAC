import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';

class DefaultUserLocationWidget extends StatelessWidget {
  const DefaultUserLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: CacheHelper.getData(key: kSaveUserLocationKey)==null?false:true,
      child: Container(width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        decoration: BoxDecoration(
          borderRadius:   BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryColor,width: 2), 
        ),child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(getShippingAddress()?.customerGovernment??' ',style: TextStyles.bold16),
          Text('${getShippingAddress()?.customerCity??' '},  ${getShippingAddress()?.customerStreetName}',style: TextStyles.semiBold13.copyWith(color: Colors.black.withOpacity(0.7))),
          ],
        ),
      ),
    );
  }
}