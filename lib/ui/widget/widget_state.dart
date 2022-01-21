import 'package:flutter/material.dart';

class WidgetState {
  static loadig(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  static loadigError(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('Gagal Ambil Data'),
      ],
    );
  }

  static empatyState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('Tidak Ada Data DI tampilkan'),
      ],
    );
  }
}
