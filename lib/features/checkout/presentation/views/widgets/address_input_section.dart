import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/widgets/custom_text_field.dart';
import 'package:fruit_e_commerce/features/checkout/domain/entities/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection(
      {super.key, required this.formKey, required this.valueListenable});

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.name =
                        value!;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.text),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.email =
                        value!;
                  },
                  hintText: 'البريد الالكتروني',
                  textInputType: TextInputType.emailAddress),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.address =
                        value!;
                  },
                  hintText: 'العنوان',
                  textInputType: TextInputType.streetAddress),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.city =
                        value!;
                  },
                  hintText: 'المدينة',
                  textInputType: TextInputType.text),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.floor =
                        value!;
                  },
                  hintText: 'رقم الطابق , رقم الشقه ..',
                  textInputType: TextInputType.text),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    context
                        .read<OrderEntity>()
                        .shippingAddressEntity
                        .phoneNumber = value!;
                  },
                  hintText: 'رقم الهاتف',
                  textInputType: TextInputType.phone),
            ],
          ),
        ),
      ),
    );
  }
}
