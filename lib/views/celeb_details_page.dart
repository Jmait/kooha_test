import 'package:flutter/material.dart';

import 'package:kooha_test/core/constants/styles.dart';
import 'package:kooha_test/core/viewModels/browse_celeb_vm.dart';
import 'package:kooha_test/views/celeb_browse_page.dart';
import 'package:stacked/stacked.dart';

class CelebDetailsPage extends StatelessWidget {
  const CelebDetailsPage({super.key, this.id});
  final String? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalStyles.appBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF333333),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            color: const Color(0xFF141414),
          ),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: ViewModelBuilder<BrowseViewModel>.reactive(
          viewModelBuilder: () => BrowseViewModel(),
          onViewModelReady: ((viewModel) => viewModel.getCelebDetails(id)),
          builder: (context, model, _) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Image.network(
                                'https://kooha-mobile-files.s3.amazonaws.com/${model.celebDetails?.profileImagePath}'),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${model.celebDetails?.fullName}',
                                style: GlobalStyles.size16,
                              ),
                              Text(
                                ' ${model.celebDetails?.occupation}',
                                style: GlobalStyles.size14.copyWith(
                                  color: GlobalStyles.lineCOlor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 92,
                          ),
                          SizedBox(
                            height: 36,
                            width: 75,
                            child: ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFF333333),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Follow',
                                  style: GlobalStyles.size14.copyWith(
                                    color: const Color(0xFFAA7105),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${model.celebDetails?.bio}',
                      style: GlobalStyles.size10.copyWith(
                        color: Color(0xFFB3B3B3),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 270,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 217,
                                    width: 174,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/sabi.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    CategoryTitle(
                      title: 'Reviews',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(itemBuilder: (context, i) {
                        return ReviewsCard();
                      }),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            height: 62,
                            width: 110,
                            child: ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFF333333),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Follow',
                                  style: GlobalStyles.size14.copyWith(
                                    color: const Color(0xFFAA7105),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            height: 62,
                            width: 210,
                            child: ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFFFF5219),
                                ),
                              ),
                              child: Text(
                                'Book Now #${model.celebDetails?.fee?.bookingFee}',
                                style: GlobalStyles.size16.copyWith(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 342,
        height: 125,
        decoration: BoxDecoration(
          color: Color(0xFF333333),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bimbo Ademoye',
                        style: GlobalStyles.size16.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text('Actress'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                'Love their drink specials. Bartenders super nice. Spent a week at UCSF and this was a very nice break for the parental unit.',
                style: GlobalStyles.size12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
