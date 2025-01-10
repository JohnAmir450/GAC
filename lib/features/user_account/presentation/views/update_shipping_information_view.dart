import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/repos/orders_repo/orders_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/widgets/custom_app_bar.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:gac/features/checkout/domain/entities/shiping_address_entity.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:gac/features/user_account/presentation/views/widgets/update_shipping_information_view_body.dart';
import 'package:provider/provider.dart';

class UpdateShippingInformationView extends StatefulWidget {
  const UpdateShippingInformationView({super.key});

  @override
  State<UpdateShippingInformationView> createState() =>
      _UpdateShippingInformationViewState();
}

class _UpdateShippingInformationViewState
    extends State<UpdateShippingInformationView> {
  late ShippingAddressEntity shippingAddressEntity;
  @override
  void initState() {
    shippingAddressEntity = ShippingAddressEntity(
      customerGovernment: getShippingAddress()?.customerGovernment ?? ' ',
      customerCity: getShippingAddress()?.customerCity ?? ' ',
      customerStreetName: getShippingAddress()?.customerStreetName ?? ' ',
      customerLocationDescription:
          getShippingAddress()?.customerLocationDescription ?? ' ',
      customerName: '${getUserData().name} ${getUserData().secondName}',
      customerEmail: getUserData().email,
      customerPhone: getUserData().phoneNumber,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'تحديث معلومات التوصيل',
        visibleLeading: true,
        onTap: () => context.pop(),
      ),
      body: Provider.value(
          value: shippingAddressEntity,
          child: BlocProvider(
            create: (context) => AccountManagerCubit(getIt.get<AuthRepo>(),getIt.get<OrdersRepo>()),
            child: const UpdateShippingInformationViewBody(),
          )),
    );
  }
}
