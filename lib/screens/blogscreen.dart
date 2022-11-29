
import 'package:feedtheneed/repositories/blog_repository.dart';
import 'package:feedtheneed/repositories/partner_reporitory.dart';
import 'package:feedtheneed/screens/blog_description.dart';
import 'package:feedtheneed/utils/api_url.dart';
import 'package:flutter/material.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Recent News',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              // margin: const EdgeInsets.all(8),
              // margin: const EdgeInsets.all(2),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Flexible(
                          flex: 1,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                            cursorColor: const Color(0xFF41A2CD),
                            decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(255, 239, 239, 239),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(15),
                                width: 18,
                                child: const Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder<List<dynamic>>(
                    future: PartnerRepository().getPartner(),
                    builder: (context, snapshot) {
                      // debugPrint(snapshot.data.toString());
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data != null) {
                          List<dynamic> lstPartner = snapshot.data!;

                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: SizedBox(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: lstPartner.length,
                                itemBuilder: (BuildContext context, int index) {
                                  String? partnerid = lstPartner[index]["_id"];
                                  return Stories(
                                    circlePadding: 2,
                                    storyItemList: [
                                      StoryItem(
                                        name: lstPartner[index]["partner_name"],
                                        thumbnail: NetworkImage(
                                          "$baseUrl${lstPartner[index]["partner_image"]!}",
                                        ),
                                        stories: [
                                          Scaffold(
                                            body: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  // fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    "$baseUrl${lstPartner[index]["banner_image"]!}",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text("No data"),
                          );
                        }
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xff754A4A)),
                          ),
                        );
                      }
                    },
                  ),
                 
    );
  }
}
