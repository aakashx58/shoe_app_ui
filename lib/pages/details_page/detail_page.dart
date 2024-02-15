import 'package:flutter/material.dart';
import 'package:shoes_app_ui/animation/animation_button.dart';
import 'package:shoes_app_ui/animation/shake_transition.dart';
import 'package:shoes_app_ui/constants.dart';
import 'package:shoes_app_ui/data/data.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _selectedIndex = 0;
  int? _value;
  static List<Color> colors = const [
    Color(0xff29695D),
    Color(0xff5B8EA3),
    Color(0xff746A36),
    Color(0xff2E2E2E),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: kTextLightColor,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              size: 33,
              color: kTextLightColor,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ShakeTransition(
                      child: Image.asset(
                        products[0].brandImage,
                        color: const Color.fromRGBO(0, 0, 0, 0.2),
                      ),
                    ),
                    PageView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Center(
                          child: ShakeTransition(
                            axis: Axis.vertical,
                            child: Image.asset(products[0].image),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ShakeTransition(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          products[0].title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontFamily: gilroySemibold,
                            letterSpacing: 0.25,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "\$${products[0].price}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: gilroySemibold,
                            letterSpacing: 0.25,
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ShakeTransition(
                    axis: Axis.vertical,
                    child: Text(
                      "\$${products[0].description}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: gilroySemibold,
                        letterSpacing: 0.25,
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: colors.length,
                          itemBuilder: (context, index) {
                            return ShakeTransition(
                              duration: const Duration(milliseconds: 1100),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = index;
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: colors[index],
                                    child: Center(
                                      child: _selectedIndex == index
                                          ? const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        ShakeTransition(
                          child: Container(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: kPrimaryColor,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: _value,
                                isExpanded: false,
                                hint: const Text(
                                  "Choose size",
                                  style: TextStyle(
                                    fontFamily: gilroySemibold,
                                    fontSize: 15,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text("M 20"),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text("L 16"),
                                  ),
                                  DropdownMenuItem(
                                    value: 3,
                                    child: Text("M 6"),
                                  ),
                                  DropdownMenuItem(
                                    value: 4,
                                    child: Text("S 12"),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _value = value ?? 0;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ShakeTransition(
                    axis: Axis.vertical,
                    child: ButtonStates(),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
