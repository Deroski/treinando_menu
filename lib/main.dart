import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _opcaoSelecionada = 0;
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              drawer: Builder(
                //Esse Builder é muito importante para funcionar o Drawer
                builder: (context) => Drawer(
                  elevation: 20,
                  //esse context que vai possibilitar a navegação para o menu
                  child: Column(
                    children: [
                      UserAccountsDrawerHeader(
                        currentAccountPicture: Image.network(
                            'http://3.bp.blogspot.com/-NpjdYoCe6Ug/UqMw8k1HGeI/AAAAAAAAEhQ/dWnoNBDqfwg/s1600/char-dk2.jpg'),
                        accountName: Text('Chris'),
                        accountEmail: Text('chris@hotmail.com'),
                      ),
                      /*endDrawer: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: Image.network(
                      'http://3.bp.blogspot.com/-NpjdYoCe6Ug/UqMw8k1HGeI/AAAAAAAAEhQ/dWnoNBDqfwg/s1600/char-dk2.jpg'),
                  accountName: Text('Chris'),
                  accountEmail: Text('chris@hotmail.com'),
                ),*/

                      //DrawerHeader(child: Text('Header'),),
                      ListTile(
                        leading: Icon(Icons.edit, color: Colors.blue),
                        title: Text(' Tela l'),
                        subtitle: Text(''),
                        onTap: () {
                          // Pop para FECHAR o MENU
                          Navigator.of(context).pop();

                          //Push para a tela 1
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Tela1();
                          }));
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.edit, color: Colors.blue),
                        title: Text('Tela 2'),
                        subtitle: Text(''),
                        onTap: () {
                          // Pop para FECHAR o MENU
                          //Navigator.of(context).pop();

                          //Push para a tela 1
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Tela2();
                          }));
                        },
                      ),
                      Text(''),
                    ],
                  ),
                ),
              ),
              appBar: AppBar(
                title: Center(child: Text('BottomNavBar & Drawer')),
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications_none_sharp),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
                elevation: 20,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 24, 24, 24), Colors.blue],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  indicatorWeight: 5,
                  tabs: [
                    Tab(icon: Icon(Icons.support_agent_sharp), text: 'Suporte'),
                    Tab(icon: Icon(Icons.star), text: 'Feed'),
                    Tab(icon: Icon(Icons.shopping_cart), text: 'Carrinho'),
                    Tab(icon: Icon(Icons.settings), text: 'Configurações'),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  elevation: 20,
                  backgroundColor: Colors.blue[700],
                  fixedColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  currentIndex: _opcaoSelecionada,
                  onTap: (opcao) {
                    print('clicou $opcao');

                    setState(() {
                      _opcaoSelecionada = opcao;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "Minha conta",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: "Pesquisa",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "Perfil",
                    ),
                  ]),
              body: /*IndexedStack(
              index: _opcaoSelecionada,
              children: <Widget>[
                HomePage(),
                Search(),
                Profile(),
              ],
            ),*/
                  TabBarView(
                children: [
                  buildPage('Suporte'),
                  buildPage('Feed'),
                  buildPage('Carrinho'),
                  buildPage('Configurações'),
                ],
              )),
        ),
      );
  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 25),
        ),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Minha conta'),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Pesquisa'),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Perfil'),
      ),
    );
  }
}

class Tela1 extends StatelessWidget {
  const Tela1({Key? Key}) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Tela 1'),
          ),
          body: Center(
            child: ElevatedButton(
              child: Text('Voltar para o menu'),
              onPressed: () {
                print('Clicou no botão da tela 1');
                Navigator.of(context).pop();
                /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Tela2();
                }));*/
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Tela2 extends StatelessWidget {
  const Tela2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tela 2'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Retornar a tela 1'),
            onPressed: () {
              print('Clicou no botão da tela 2');

              Navigator.of(context).pop();
              //Navigator.pop(context);
            },
          ),
        ),
      ),
    ));
  }
}
