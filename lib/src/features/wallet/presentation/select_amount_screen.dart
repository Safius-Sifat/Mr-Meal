import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../../routing/app_router.dart';
import '../../../utils/async_value_ui.dart';
import 'wallet_controller.dart';

class SelectAmountScreen extends ConsumerStatefulWidget {
  const SelectAmountScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectAmountScreenState();
}

class _SelectAmountScreenState extends ConsumerState<SelectAmountScreen> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String get value => _controller.text;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(
      rechargeWalletProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(rechargeWalletProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text('Amount'.hardcoded),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p20),
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: 'Enter recharge amount',
                  hintStyle: const TextStyle(
                    color: textFieldHint,
                    fontSize: Sizes.p16,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: textFieldColor),
                    borderRadius: BorderRadius.circular(Sizes.p8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                  ),
                  filled: true,
                  fillColor: textFieldColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter amount';
                  }
                  return null;
                },
              ),
              gapH24,
              PrimaryButton(
                width: 160,
                isLoading: state.isLoading,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final amount = int.tryParse(value);

                    if (amount == null) return;
                    final success = await ref
                        .read(rechargeWalletProvider.notifier)
                        .rechargeWallet(amount: amount);
                    if (success) {
                      final url = ref.read(rechargeWalletProvider).valueOrNull;

                      context.pop();
                      if (url != null) {
                        context.pushNamed(AppRoute.payment.name,
                            pathParameters: {'url': url});
                      }
                    }
                  }
                },
                text: 'Recharge',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
