import 'package:flutter/material.dart';
import 'package:kooha_test/core/constants/routes_names.dart';
import 'package:kooha_test/core/constants/styles.dart';
import 'package:kooha_test/core/viewModels/browse_celeb_vm.dart';
import 'package:kooha_test/views/login.dart';
import 'package:stacked/stacked.dart';

class BrowseCelebPage extends StatelessWidget {
  const BrowseCelebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalStyles.appBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Browse'),
      ),
      body: ViewModelBuilder<BrowseViewModel>.reactive(
          viewModelBuilder: () => BrowseViewModel(),
          onViewModelReady: (viewModel) {
            viewModel.getTrendingCeleb();
            viewModel.getFeaturedCeleb();
          },
          builder: (context, model, _) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      onChanged: (v) {
                        model.searchCeleb(v);
                      },
                      formHintText: 'Search',
                      formTitle: '',
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 36,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          BrowseCelebCategories(
                            categoryName: 'Actors',
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          BrowseCelebCategories(
                            categoryName: 'Altheletes',
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          BrowseCelebCategories(
                            categoryName: 'Comedians',
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          BrowseCelebCategories(
                            categoryName: 'Content creator',
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: GlobalStyles.lineCOlor,
                    ),
                    SizedBox(
                      height: 46,
                    ),
                    CategoryTitle(
                      title: 'Featured',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 275,
                      child: model.isBusy
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : ListView.builder(
                              itemCount:
                                  model.celebDataModel?.data?.records?.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                final record =
                                    model.celebDataModel?.data?.records?[i];
                                print(record?.profileImagePath);
                                return Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        celebDetailsRoute,
                                        arguments: record?.uuid,
                                      );
                                    },
                                    child: CelebrityCard(
                                      image: record?.profileImagePath,
                                      celebNickName: record?.fullName,
                                      career: record?.occupation,
                                      fee: record?.fee?.bookingFee.toString(),
                                    ),
                                  ),
                                );
                              }),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    CategoryTitle(
                      title: 'Trending',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 275,
                      child: model.isBusy
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.trendingCelebDataModel?.data
                                  ?.records?.length,
                              itemBuilder: (context, i) {
                                final record = model
                                    .trendingCelebDataModel?.data?.records?[i];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: InkWell(
                                    onTap: () {
                                      print('hello');
                                      Navigator.pushNamed(
                                        context,
                                        celebDetailsRoute,
                                        arguments: record?.uuid,
                                      );
                                    },
                                    child: CelebrityCard(
                                      image: record?.profileImagePath,
                                      celebNickName: record?.fullName,
                                      career: record?.occupation ?? 'N/A',
                                      fee: record?.fee?.bookingFee.toString(),
                                    ),
                                  ),
                                );
                              }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GlobalStyles.size16.copyWith(
            color: Color(0xFF4D4D4D),
          ),
        ),
        SizedBox(
          width: 234,
        ),
        Text(
          'See all',
          style: GlobalStyles.size14.copyWith(
            color: const Color(0xFFF8A80D),
          ),
        ),
      ],
    );
  }
}

class CelebrityCard extends StatelessWidget {
  const CelebrityCard({
    Key? key,
    this.celebNickName,
    this.career,
    this.image,
    this.fee,
  }) : super(key: key);
  final String? celebNickName;
  final String? career;
  final String? fee;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 217,
          width: 174,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://kooha-mobile-files.s3.amazonaws.com/${image ?? '9x2gt5l0aKCHcMMkZUSJWGxzZ.jpg'}'),
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          '$celebNickName',
          style: GlobalStyles.size14,
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          '$career',
          style: GlobalStyles.size10.copyWith(
            color: GlobalStyles.lineCOlor,
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          '#$fee',
          style: GlobalStyles.size10.copyWith(
            color: const Color(0xFFF8A80D),
          ),
        ),
      ],
    );
  }
}

class BrowseCelebCategories extends StatelessWidget {
  const BrowseCelebCategories({
    Key? key,
    required this.categoryName,
  }) : super(key: key);
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 75,
      decoration: BoxDecoration(
          border: Border.all(color: GlobalStyles.lineCOlor),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          )),
      child: Center(
        child: Text(
          categoryName,
          style: GlobalStyles.size10,
        ),
      ),
    );
  }
}
