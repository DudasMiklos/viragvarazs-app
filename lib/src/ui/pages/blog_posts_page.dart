import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:viragvarazs/src/models/blog/blog_model.dart';
import 'package:viragvarazs/src/providers/blog_provider.dart';
import 'package:viragvarazs/src/resources/theme/application_style.dart';
import 'package:viragvarazs/src/ui/custom_loader.dart';
import 'package:viragvarazs/src/ui/widgets/custom_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viragvarazs/src/ui/widgets/custom_drawer.dart';

@RoutePage()
class BlogPostsPage extends StatefulWidget {
  const BlogPostsPage({super.key});

  @override
  State<BlogPostsPage> createState() => _BlogPostsPageState();
}

class _BlogPostsPageState extends State<BlogPostsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List<BlogModel> blogs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    blogs = Provider.of<BlogProvider>(context, listen: true).blogs;
    return Scaffold(
      appBar: CustomAppbar(
        scaffoldKey: scaffoldKey,
        title: "Posztok",
        onCreateTap: () {
          //AutoRouter.of(context).push(const CreateBlogPostRoute());
        },
      ),
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            Provider.of<BlogProvider>(context, listen: true).isLoading
                ? const SliverFillRemaining(
                    hasScrollBody: false,
                    fillOverscroll: true,
                    child: Center(
                      child: CustomLoader(),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: ApplicationStyle.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: ApplicationStyle.primaryColor
                                    .withOpacity(0.3),
                              ),
                            ),
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: AspectRatio(
                                      aspectRatio: 4 / 3,
                                      child: CachedNetworkImage(
                                        imageUrl: blogs[index].imageUrl,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                            color:
                                                ApplicationStyle.primaryColor,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error_outline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  blogs[index].headerText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: ApplicationStyle.darkColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: const Divider(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        blogs[index].smallText,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: ApplicationStyle.darkColor,
                                              fontSize: 18,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        blogs[index].firstParagraph,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: ApplicationStyle.darkColor,
                                              fontSize: 18,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        blogs[index].secondParagraph,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: ApplicationStyle.darkColor,
                                              fontSize: 18,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: const Divider(),
                                ),
                                Text(
                                  "${blogs[index].createdAt} - ${blogs[index].publicatorName}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: ApplicationStyle.darkColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 4,
                                )
                              ],
                            ),
                          );
                        },
                        childCount: blogs.length,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
