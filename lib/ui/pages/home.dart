import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/category.dart';
import '../colors.dart';
import '../widgets/quiz_options.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBackground,
        body: Stack(
          children: <Widget>[
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //App Title - LetsQuiz
                        Text(
                          "Lets Quiz",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: 35.0),
                        ),

                        //About Developer Icon
                        Builder(
                          builder: (context) => IconButton(
                              icon: Icon(Icons.info),
                              iconSize: 30.0,
                              color: Colors.grey,
                              onPressed: () =>
                                  Navigator.of(context).pushNamed('/about')),
                        )
                      ],
                    ),
                  ),
                ),

                //Do you know? card widget
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: _buildContentCard(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //Do you know bulb Icon
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: SvgPicture.asset(
                                'assets/images/bulb.svg',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),

                            //Do you know Text
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                    text: 'Do You Know?\n',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: "GoogleSans"),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Playing quiz everyday can increase your brain power and cognition.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        color: color6,
                      )),
                ),

                //Choose category Text
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: Text(
                      "Select a category to start the quiz",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0),
                    ),
                  ),
                ),

                //Category card options widget
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0),
                    delegate: SliverChildBuilderDelegate(
                      _buildCategoryItem,
                      childCount: categories.length,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  //Home page - Clickable quiz category
  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];

    return Container(
      child: GestureDetector(
          child: _buildContentCard(
            color: category.color.withOpacity(0.9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 26,
                  width: 26,
                  child: Image.asset(
                    'assets/images/${category.name}.png',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  category.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          onTap: () {
            _categoryPressed(context, category);
          }),
    );
  }

  //Colorful Cards
  Widget _buildContentCard({@required Color color, @required Widget child}) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.fromLTRB(16, 32, 16, 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color,
      ),
      child: child,
    );
  }

  //Action performed when category card is clicked/pressed
  _categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }
}
