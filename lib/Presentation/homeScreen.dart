import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zehntech_assignment/Providers/homeProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeProvider = HomeProvider();

  @override
  void initState() {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.fetchUsersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200.withOpacity(0.99),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Icon(Icons.menu, color: Colors.white, size: 35),
        ),
        actions: [
          InkWell(
            onTap: () {
              homeProvider.logOut();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.logout, color: Colors.white),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 105,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, top: 5),
                        child: Text("Home",
                            style: TextStyle(
                                fontSize: 32, color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, top: 2),
                        child: Text("Team bedrijfsbureau",
                            style: TextStyle(
                                fontSize: 20, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Verbetersuggesties",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black)),
                          Container(
                            color: Colors.blue,
                            height: 2,
                            width: MediaQuery.of(context).size.width * 0.15,
                          )
                        ],
                      ),
                      Card(
                        color: Colors.blue,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                buildList1(homeProvider: homeProvider),
                ///Score
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Score",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black)),
                          Container(
                            color: Colors.blue,
                            height: 2,
                            width: MediaQuery.of(context).size.width * 0.15,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 12,top: 12,right: 12
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.star),
                              Text("65",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.orange)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 12,bottom: 12,right: 12
                          ),
                          child: Text("Goed bezig, #1 Emma Green!",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ),
                ///Moodindicator
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Moodindicator",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black)),
                          Container(
                            color: Colors.blue,
                            height: 2,
                            width: MediaQuery.of(context).size.width * 0.15,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text("Hoeveel plezier heb je momenteel\nin je werk?",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 350,
                          child: ListView.builder(
                            controller: homeProvider.scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: homeProvider.iconList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(homeProvider.iconList[index],size: 30),
                              );
                            },
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  buildList1({required HomeProvider homeProvider}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: homeProvider.isLoading
          ? const Center(
              child: Text(
              "Loading......",
              style: TextStyle(
                  color: Colors.blue, fontSize: 22),
            ))
          : homeProvider.homeModel.data.toString() == "[]"
              ? const Text("No Data Found")
              : ListView.builder(
                  itemCount: homeProvider.homeModel.data == null
                      ? 0
                      : homeProvider.homeModel.data!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.fill,
                                              height: 40,
                                              width: 40,
                                              imageUrl: homeProvider.homeModel.data![index].avatar.toString(),
                                              placeholder: (context, url) =>
                                                  const Icon(Icons.image),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("${homeProvider.homeModel.data![index].firstName.toString()} ${homeProvider.homeModel.data![index].lastName.toString()}",
                                                    style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Colors
                                                                .white)),
                                                Text(homeProvider.homeModel.data![index].email.toString(),
                                                    style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Colors
                                                                .white)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 2)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 12),
                                          child: Column(
                                            children: [
                                              Text("Startdatum",
                                                  style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black45)),
                                              Text("01-01-2021",
                                                  style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .black)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 12,
                                          ),
                                          child: Row(
                                            children: [
                                              Text("Status",
                                                  style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black45)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 12,
                                          ),
                                          child: Text("OK Status",
                                              style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black45)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 12, left: 25),
                                          child: Column(
                                            children: [
                                              Text("Einddatum",
                                                  style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black45)),
                                              Text("11-02-2021",
                                                  style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors
                                                              .black)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 12),
                                          child: Text("Lopend",
                                              style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                          Colors.black)),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 12),
                                          child: Text("IN Orde",
                                              style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                          Colors.black)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Analyseer lange doorlooptijd",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black45)),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
    );
  }
}



