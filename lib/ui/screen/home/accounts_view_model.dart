import 'package:flutter/material.dart';
import 'package:honpass/db/entity/account.dart';
import 'package:honpass/db/entity/service.dart';
import 'package:honpass/repository/account_repository.dart';
import 'package:honpass/repository/service_repository.dart';

class AccountsViewModel with ChangeNotifier {

  final AccountRepository _accountRepository;
  final ServiceRepository _serviceRepository;

  AccountsViewModel(this._accountRepository, this._serviceRepository) {
    _fetchAll();
  }

  List<Map<Account, Service>> _accountMaps = [];

  List<Map<Account, Service>> get accountMaps => _accountMaps;

  void _fetchAll() async {

    _accountMaps.clear();

    final account = await _accountRepository.accounts();

    account.forEach((Account account) async {

      final service = await _serviceRepository.service(account.serviceId);

      _accountMaps.add({account: service});
    });

    notifyListeners();
  }
}