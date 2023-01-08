import 'package:feedtheneed/model/blog.dart';
import 'package:feedtheneed/repositories/blog_repository.dart';
import 'package:feedtheneed/utils/api_url.dart';
import 'package:flutter/material.dart';

class BlogDescription extends StatefulWidget {
  final String blogId;
  const BlogDescription({Key? key, required this.blogId}) : super(key: key);

  @override
  State<BlogDescription> createState() => _BlogDescriptionState();
}

class _BlogDescriptionState extends State<BlogDescription> {
  Blog? blog;
  @override
  void initState() {
    getblogDetails();
    super.initState();
  }

  void getblogDetails() async {
    Blog? blog1 = await BlogRepository().getSingleBlogs(widget.blogId);

    setState(() {
      blog = blog1!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return blog != null
        ? Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Recent News',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Column(
                    children: [
                      Text(
                        // headline6,
                        blog!.blog_name!,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 80, 80, 80),
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                // side: const BorderSide(
                                //   color: Color.fromARGB(255, 217, 217, 217),
                                //   width: 1,
                                // ),
                              ),
                              clipBehavior: Clip.none,
                              key: const ValueKey(["id"]),
                              // margin: EdgeInsets.all(5),
                              color: const Color.fromARGB(255, 243, 243, 243),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 27,
                                    backgroundImage: NetworkImage(
                                        baseUrl + blog!.donor_image!),
                                  ),
                                ),
                                title: Text(
                                  blog!.donor_name!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  blog!.blog_category!,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                trailing: Text(
                                  blog!.blog_price!.toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          // color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: NetworkImage(baseUrl + blog!.blog_image!),
                            fit: BoxFit.cover,
                          ),

                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: blog!.blog_desc!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                height: 1.7,
                                wordSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const Scaffold();
  }
}
