import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/features/checkout/domain/entities/shiping_address_entity.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:gac/features/user_account/presentation/views/widgets/update_user_government_shipping_widget.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class UpdateShippingInformationViewBody extends StatelessWidget {
  const UpdateShippingInformationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final shippingAddress = context.read<ShippingAddressEntity>();
    final cubit = context.read<AccountManagerCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              verticalSpace(24),
              CustomGovernmentUpdateShippingSelector(
                onSelected: (value) {
                  // Update state and trigger UI rebuild
                  shippingAddress.customerGovernment = value;
                  context.read<AccountManagerCubit>().userDataChanged();
                },
              ),
              verticalSpace(16),
              CustomTextFormField(
                needsValidation:  shippingAddress.customerCity==' ',
                onChanged: (value) {
                  shippingAddress.customerCity = value;
                  cubit.userDataChanged();
                },
                hintText: shippingAddress.customerCity ?? 'المدينة او القرية',
                labelText: shippingAddress.customerCity==' '? 'المدينة او القرية':null,
               
              ),
              verticalSpace(16),
              CustomTextFormField(
                needsValidation: shippingAddress.customerStreetName==' ',
                onChanged: (value) {
                  shippingAddress.customerStreetName = value;
                  cubit.userDataChanged();
                },
                hintText: shippingAddress.customerStreetName ?? 'اسم الشارع' ,
                labelText: shippingAddress.customerStreetName==' '? 'اسم الشارع':null,
             
              ),
              verticalSpace(16),
              CustomTextFormField(
                needsValidation: false,
                onChanged: (value) {
                  shippingAddress.customerLocationDescription = value;
                  cubit.userDataChanged();
                },
                hintText: shippingAddress.customerLocationDescription ?? 'وصف المكان (اختياري)',
                labelText:shippingAddress.customerLocationDescription==' '? 'وصف المكان (اختياري)':null,
                //initialValue: shippingAddress.customerLocationDescription ?? '',
                maxLines: 5,
              ),
              verticalSpace(MediaQuery.sizeOf(context).height * 0.1),
              BlocBuilder<AccountManagerCubit, AccountManagerState>(
                builder: (context, state) {
                  return CustomButton(
                    backgroundColor: cubit.hasChanges
                        ? AppColors.primaryColor
                        : Colors.grey.shade400,
                    text: 'تحديث',
                    onPressed: () {
                      if (cubit.hasChanges) {
                        if(cubit.formKey.currentState!.validate()){
                          cubit.saveShippingData(context, shippingAddress);
                        }
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
