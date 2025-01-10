import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/features/checkout/domain/entities/shiping_address_entity.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class UpdateShippingInformationViewBody extends StatelessWidget {
  const UpdateShippingInformationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final shippingAddress = context.read<ShippingAddressEntity>();
    final cubit=context.read<AccountManagerCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(24),
            CustomTextFormField(
              needsValidation: true,
              onChanged: (value) {
                shippingAddress.customerGovernment = value;
               cubit.userDataChanged();
              },
              hintText: 'المحافظة',
              initialValue: shippingAddress.customerGovernment ?? '',
            ),
            verticalSpace(16),
            CustomTextFormField(
              needsValidation: true,
              onChanged: (value) {
                shippingAddress.customerCity = value;
               cubit.userDataChanged();
              },
              hintText: 'المدينة او القرية',
              initialValue: shippingAddress.customerCity ?? '',
            ),
            verticalSpace(16),
            CustomTextFormField(
              needsValidation: true,
              onChanged: (value) {
                shippingAddress.customerStreetName = value;
                cubit.userDataChanged();
              },
              hintText: 'اسم الشارع',
              initialValue: shippingAddress.customerStreetName ?? '',
            ),
            verticalSpace(16),
            CustomTextFormField(
              needsValidation: false,
              onChanged: (value) {
                shippingAddress.customerLocationDescription = value;
               cubit.userDataChanged();
              },
              hintText: 'وصف المكان (اختياري)',
              initialValue: shippingAddress.customerLocationDescription ?? '',
              maxLines: 5,
            ),
            verticalSpace(MediaQuery.sizeOf(context).height * 0.1),
            BlocBuilder<AccountManagerCubit, AccountManagerState>(
              builder: (context, state) {
                return CustomButton(backgroundColor: cubit.hasChanges? AppColors.primaryColor: Colors.grey.shade400,
                          text: 'تحديث',
                          onPressed: () {
                            if(cubit.hasChanges){
                               cubit.saveShippingData(context, shippingAddress);
                            }
                          },
                        );
              },
            ),
          ],
        ),
      ),
    );
  }

 
}
