import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/presentation/address_screen/widget/address_card.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen();

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text(
          'My Addresses',
          style: context.textStyle?.labelLarge?.copyWith(fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 1,
        shadowColor: AppColors.lynxWhite,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 50,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.add),
                          SizedBox(width: 10),
                          Text(
                            "Add Address",
                            style: context.textStyle?.titleLarge,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.arrow_forward_ios_rounded, size: 18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'SAVED ADDRESSES',
                  style: context.textStyle?.titleLarge?.copyWith(fontSize: 14),
                ),
              ),
              SizedBox(height: 14),
              AddressCard(
                context: context,
                title: 'Home',
                address: '502, Sunrise Coliving PG, Vyalikaval HBCS Layout, Nagava...',
                distance: '0 m',
                phoneNumber: '+91-8374998490',
              ),
              AddressCard(
                context: context,
                title: 'Bgl PG',
                address: '#5/49, Devarabisanahalli, Bellandur, Bengaluru',
                distance: '14 km',
                phoneNumber: '+91-8374998490',
              ),
              AddressCard(
                context: context,
                title: 'Malika Arjun PG',
                address: '424, 3 Floor, Devarabisanahalli, Bellandur, Bengaluru',
                distance: '14 km',
                phoneNumber: '+91-8374998490',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
