import 'package:duan_flutter/bloc/bloc_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


const IconData eyeIcon = Icons.visibility;

class EyeIconCubit extends Cubit<bool> {
  EyeIconCubit() : super(true);

  void toggleIcon() {
    emit(!state);
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EyeIconCubit>(create: (context) => EyeIconCubit()),
        BlocProvider<MyListBloc>(create: (context) => MyListBloc()..loadData()),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 280,
                color: Colors.blue[800],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: const Center(
                              child: Text(
                                "NT",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Trungnguyen",
                                    style: TextStyle(color: Colors.white)),
                                BlocBuilder<EyeIconCubit, bool>(
                                  builder: (context, state) {
                                    return Row(
                                      children: [
                                        Text(state ? "*đ" : "0đ",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        IconButton(
                                          icon: const Icon(eyeIcon,
                                              color: Colors.white),
                                          onPressed: () {
                                            context
                                                .read<EyeIconCubit>()
                                                .toggleIcon();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.amber),
                            ),
                            child: const Text("Chưa định danh",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Giới thiệu bạn bè \n nhận ngay 1.000.000đ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green), // Thay đổi màu sắc ở đây
                            ),
                            child: const Text(
                              "Giới thiệu ngay",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 380,
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3))
                                ]),
                            child: Row(
                              children: [
                                Image.asset("assets/your_image.jpg"), // Thay đổi đường dẫn hình ảnh
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            "Hoàn thành nhiệm vụ nhận ngay 500 điểm",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 200,
                            child: BlocBuilder<MyListBloc, List<myData>>(
                              builder: (context, state) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final myData data = state[index];
                                    return Container(
                                      height: 200,
                                      width: 150,
                                      margin: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: const Offset(0, 3))
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Text(data.nhiemvu,
                                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                            Text("+${data.diemso} điểm",
                                                style: const TextStyle(color: Colors.green)),
                                            TextButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                                              child: const Text("Thực hiện",
                                                  style: TextStyle(color: Colors.white)),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: 500,
                color: Colors.amber,
              )
            ],
          ),
        ),
      ),
    );
  }
}
