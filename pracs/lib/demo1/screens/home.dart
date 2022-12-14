import 'package:flutter/material.dart';
import 'package:pracs/demo1/utils/text_utils.dart';
import 'package:pracs/demo1/widgets/post_view_widget.dart';
import 'package:pracs/demo1/widgets/story_view_widget.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final TextUtils _textUtils = TextUtils();
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 10,right: 10),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for(int i = 0; i<20; i++)
                  Container(
                    width: 70,
                    margin: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        const StoryViewWidget(),
                        const SizedBox(height: 10,),
                        _textUtils.normal14Ellipsis('proglabsoffical', Colors.black),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          for(int i = 0; i < 10; i++)
            const PostViewWidget(),
        ],
      ),
    );
  }
}
