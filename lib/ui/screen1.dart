import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/bloc/rocket_bloc.dart';
import 'package:untitled3/repositry/modelclass/rocket.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

late Rocketmodel rocket;

class _screen1State extends State<screen1> {
  @override
  void initState() {
    BlocProvider.of<RocketBloc>(context).add(Fetchrocket());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          toolbarHeight: 70,
          title: Text(
            "Rocket League",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "caros",
                color: Colors.white),
          ),
        ),
        body: BlocBuilder<RocketBloc, RocketState>(builder: (context, state) {
          if (state is RocketLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RocketError) {
            return RefreshIndicator(
              onRefresh: () async {
                return BlocProvider.of<RocketBloc>(context).add(Fetchrocket());
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    // color: Colors.red,
                    child:
                        const Center(child: Text('Oops something went wrong'))),
              ),
            );
          }
          if (state is RocketLoaded) {
            rocket = BlocProvider.of<RocketBloc>(context).rocketmodel;
            return ListView.builder(
              itemCount: rocket.ranks!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: 375,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.black),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "division  :  ${rocket.ranks![index].division.toString()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                          Text(
                              "played  :  ${rocket.ranks![index].played.toString()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                          Text(
                              "rank  :  ${rocket.ranks![index].rank.toString()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                          Text(
                              "playlist  :  ${rocket.ranks![index].playlist.toString()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                          Text("mmr  :  ${rocket.ranks![index].mmr.toString()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                          Text(
                              "streak  :  ${rocket.ranks![index].streak.toString()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white))
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          } else {
            return SizedBox();
          }
        }));
  }
}
