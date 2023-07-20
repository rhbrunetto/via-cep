import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../core/account/models/account_data.dart';
import '../../../di.dart';
import '../../../routes.gr.dart';
import '../data/address_repository.dart';
import '../models/address.dart';

extension AddressExt on BuildContext {
  Future<void> createAddress() async {
    final data = await router.push(AddressFormRoute());
    if (data is! AddressData) return;

    final address = Address(
      id: const Uuid().v4(),
      userId: read<AccountData>().userId,
      created: DateTime.now(),
      data: data,
    );

    await sl<AddressRepository>().save(address);
  }

  Future<void> editAddress(Address address) async {
    final edited = await router.push(AddressFormRoute(data: address.data));
    if (edited is! AddressData) return;

    await sl<AddressRepository>().save(address.copyWith(data: edited));
  }

  Future<void> deleteAddress(Address address) async {
    await sl<AddressRepository>().delete(address);
  }
}
