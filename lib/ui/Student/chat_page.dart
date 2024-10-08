import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signify/router_constants.dart';
import 'package:signify/ui/Student/drawer_page.dart';
import 'package:signify/ui/Student/home_page.dart';
import 'package:signify/ui/Student/individual_chat_page.dart';
import 'package:signify/ui/Student/text_to_sign.dart';
import 'package:signify/leviosaai.dart';
import 'package:signify/widgets/common/gradient_text.dart';
import 'package:signify/widgets/common/levi_button.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final GlobalKey<ScaffoldState> key = GlobalKey();

  final calling = TextEditingController();

  @override
  void dispose() {
    calling.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: const Drawerpage(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        leading: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                key.currentState!.openDrawer();
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/img/teacher.jpeg"),
              ),
            ),
          ],
        ),
        title: const GradientText(
          'Leviosa',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          gradient: LinearGradient(
              colors: [Color.fromRGBO(228, 212, 156, 1), Color(0xffad9c00)]),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Texttosign()));
            },
            icon: const Icon(
              Icons.text_fields_outlined,
              color: Color.fromRGBO(228, 212, 156, 1),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Homepage()));
            },
            child: const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/img/videocall1.webp"),
            ),
          ),
          const SizedBox(
            width: 25,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                          child: Container(
                        height: 200,
                        width: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 233, 223, 190),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Call id:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: calling,
                                decoration: const InputDecoration(
                                    hintText: "Please Enter call id",
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const Spacer(),
                            LeviButton(
                              child: const Text(
                                "Join Meeting",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                context.push(
                                  RouterConstants.callPage,
                                  extra: {
                                    "callId": calling,
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ));
                    });
              },
              child: Row(
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.video_camera_front_outlined),
                  ),
                  Text(
                    "Create a Meet with a Id...",
                    style: TextStyle(color: Colors.blue[100]),
                  ),
                ],
              ),
            ),
            customsearch(),
            customlist("Kabilan", "hello", "assets/img/kabi.jpeg", context),
            customlist("Damin Rido", "hi", "assets/img/rido.jpeg", context),
            customlist("Damin Risho", "Good morning", "assets/img/risho.jpeg",
                context),
            customlist("Swathi", "ok", "assets/img/swa.jpeg", context),
            customlist("Anisha", "bye bye", "assets/img/anu.jpeg", context),
            customlist(
                "Praveena", "how are you", "assets/img/pra.jpeg", context),
            customlist(
                "Priya", "hi praveena", "assets/img/priya.jpeg", context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChatScreen()));
        },
        backgroundColor: const Color.fromARGB(255, 243, 227, 173),
        child: SizedBox(
          width: 30,
          height: 30,
          child: Image.asset("assets/img/chatbot_15320513.png"),
        ),
      ),
    );
  }

  Widget customsearch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              prefixIcon: Icon(Icons.search),
              hintText: "Search")),
    );
  }
}

Widget customlist(txt, subtxt, img, BuildContext context) {
  return ListTile(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Individualchatpage(
                    name: txt,
                    img: img,
                  )));
    },
    leading: CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage(img),
    ),
    title: Text(
      txt,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
      subtxt,
      style: const TextStyle(color: Colors.grey),
    ),
    trailing: const Text("2.00 pm"),
  );
  //   return Scaffold(
  //     appBar: AppBar(
  //       toolbarHeight: 60,
  //       leadingWidth: 35,
  //       backgroundColor: const Color.fromARGB(255, 233, 223, 190),
  //       title: const Text(
  //         "Communities",
  //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //       ),
  //       actions: const [
  //         Icon(Icons.more_vert_outlined),
  //         SizedBox(
  //           width: 20,
  //         )
  //       ],
  //     ),
  //     body: Column(
  //       children: [
  //         customTextfield("Search"),
  //         customlist("Kabilan", "hello", "assets/img/kabi.jpeg", context),
  //         customlist("Damin Rido", "hi", "assets/img/rido.jpeg", context),
  //         customlist(
  //             "Damin Risho", "Good morning", "assets/img/risho.jpeg", context),
  //         customlist("Swathi", "ok", "assets/img/swa.jpeg", context),
  //         customlist("Anushiya", "bye bye", "assets/img/anu.jpeg", context),
  //         customlist("Praveena", "how are you", "assets/img/pra.jpeg", context),
  //         customlist("Priya", "hi praveena", "assets/img/priya.jpeg", context),
  //       ],
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {},
  //       backgroundColor: const Color.fromARGB(255, 233, 223, 190),
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }

  // Widget customTextfield(String subtittle) {
  //   return Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
  //       child: ConstrainedBox(
  //         constraints: const BoxConstraints(
  //           maxHeight: 50,
  //         ),
  //         child: TextFormField(
  //           decoration: InputDecoration(
  //             prefixIcon: const Icon(
  //               Icons.search,
  //               color: Colors.black,
  //             ),
  //             hintText: subtittle,
  //             enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(15),
  //               borderSide: const BorderSide(color: Colors.black),
  //             ),
  //             focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(15),
  //               borderSide: const BorderSide(color: Colors.black),
  //             ),
  //           ),
  //         ),
  //       ));
  // }

  // Widget customlist(txt, subtxt, img, BuildContext context) {
  //   return ListTile(
  //     onTap: () {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => Individualchatpage(
  //                     name: txt,
  //                     img: img,
  //                   )));
  //     },
  //     leading: CircleAvatar(
  //       radius: 30,
  //       backgroundImage: AssetImage(img),
  //     ),
  //     title: Text(
  //       txt,
  //       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //     ),
  //     subtitle: Text(
  //       subtxt,
  //       style: const TextStyle(color: Colors.grey),
  //     ),
  //     trailing: const Text("2.00 pm"),
  //   );
  // }
}
