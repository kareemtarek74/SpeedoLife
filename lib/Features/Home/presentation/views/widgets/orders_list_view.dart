import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  static const List<Map<String, dynamic>> invoices = [
    {
      "status": "معلق",
      "statusColor": Color(0xffFFC300),
      "products": 2,
      "price": 15669,
      "time": "منذ 3 ساعات"
    },
    {
      "status": "مكتمل",
      "statusColor": Color(0xff30C1A7),
      "products": 2,
      "price": 15669,
      "time": "منذ 3 ساعات"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: invoices.length,
      itemBuilder: (context, index) {
        final invoice = invoices[index];
        return OrdersListViewItem(invoice: invoice);
      },
    );
  }
}

class OrdersListViewItem extends StatelessWidget {
  const OrdersListViewItem({
    super.key,
    required this.invoice,
  });

  final Map<String, dynamic> invoice;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: SvgPicture.asset(Assets.imagesInvoice),
            ),
            const SizedBox(
              width: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'فاتورة 304',
                    style: Styles.styleBold16(context),
                  ),
                  Row(
                    children: [
                      Text(
                        '2 منتجات',
                        style: Styles.styleSemiBold14(context)
                            .copyWith(color: const Color(0xff555555)),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '.',
                        style: Styles.styleSemiBold14(context)
                            .copyWith(color: const Color(0xff555555)),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text('15,669 د',
                          style: Styles.styleSemiBold14(context)
                              .copyWith(color: const Color(0xff555555)))
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: invoice['statusColor'],
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      child: Text(
                        '${invoice['status']}',
                        style: Styles.styleMedium12(context)
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'منذ 3 ساعات',
                    style: Styles.styleMedium12(context)
                        .copyWith(color: const Color(0xff808080)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 24,
                  )),
            )
          ],
        ));
  }
}
