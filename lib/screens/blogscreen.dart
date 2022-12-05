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
                  FutureBuilder<List<dynamic>>(
                    future: BlogRepository().getBlogs(),
                    builder: (context, snapshot) {
                      // debugPrint(snapshot.data.toString());
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data != null) {
                          List<dynamic> lstblog = snapshot.data!;
                          // debugPrint("dsfsjnj${lstblog.length}");
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.53,
                            child: ListView.builder(
                              itemCount: lstblog.length,
                              itemBuilder: (BuildContext context, int index) {
                                String? blogid = lstblog[index]["_id"];
                                return snapshot.data![index]!["blog_name"]!
                                        .toLowerCase()
                                        .contains(searchQuery.toLowerCase())
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Container(
                                          height: 95,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.06),
                                                spreadRadius: 0,
                                                blurRadius: 4,
                                                offset: const Offset(0,
                                                    4), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 90,
                                                width: 100,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11.0),
                                                  child: Image.network(
                                                    "$baseUrl${lstblog[index]["blog_image"]!}",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 18),
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        lstblog[index]
                                                            ["blog_name"],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        lstblog[index]
                                                            ["blog_category"],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                BlogDescription(
                                                                    blogId:
                                                                        blogid!)),
                                                      );
                                                      //action coe when button is pressed
                                                    },
                                                    icon: const Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                      color: Color(0xFF41A2CD),
                                                      size: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox();
                              },
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
