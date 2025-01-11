import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/custom_home_app_bar.dart';
import 'package:speedo_life/Features/Orders/presentation/widgets/filter_list_view.dart';
import 'package:speedo_life/Features/Orders/presentation/widgets/orders_list_view.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomHomeAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'طلباتي',
                          style: Styles.styleBold20(context),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '(3) فواتير',
                          style: Styles.styleSemiBold16(context)
                              .copyWith(color: const Color(0xff808080)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const FilterListView(
                      horizontalPadding: 26,
                      filters: ["الكل", "انتظار", "مكتمل", "مرفوض"],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SliverFillRemaining(child: OrdersListView())
      ],
    );
  }
}
