import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/202/cache/shared_manage.dart';

class SharedCacheLearn extends StatefulWidget {
  const SharedCacheLearn({Key? key}) : super(key: key);

  @override
  State<SharedCacheLearn> createState() => _SharedCacheLearnState();
}

class _SharedCacheLearnState extends LoadingStateful<SharedCacheLearn> {
  late final List<User> users;
  int _currentValue = 0;
  late final SharedManage _manager;
  @override
  void initState() {
    super.initState();
    _manager = SharedManage();
    users = UserItems().users;

    _initialized();
  }

  Future<void> _initialized() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    onChangeValue(_manager.getStrings(SharedKeys.counter) ?? '');
  }

  void onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(_currentValue.toString()),
        actions: [
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink()
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [floatingSaveButton(), floatingRemoveButton()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            onChanged: (value) {
              onChangeValue(value);
            },
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: users.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(users[index].name),
                        subtitle: Text(users[index].description),
                        trailing: Text(
                          users[index].url,
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            decoration: TextDecoration.underline
                          )
                        ),
                      ),
                    );
                  })))
        ],
      ),
    );
  }

  FloatingActionButton floatingSaveButton() {
    return FloatingActionButton(
        onPressed: (() async {
          changeLoading();
          await _manager.saveString(SharedKeys.counter, _currentValue.toString());
          changeLoading();
        }),
        child: const Icon(Icons.add));
  }

  FloatingActionButton floatingRemoveButton() {
    return FloatingActionButton(
        onPressed: (() async {
          changeLoading();
          _manager.removeItem(SharedKeys.counter);
          changeLoading();
          _currentValue = 0;
        }),
        child: const Icon(Icons.remove));
  }
}

class User {
  final String name;
  final String description;
  final String url;

  User(this.name, this.description, this.url);
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('tuna', 'dsc1', '.com'),
      User('nil', 'ds2x', '.exe'),
      User('efsun', 'dsc1asda', '.pts'),
      User('füsun', 'dsc1acşixcv', '.xcs'),
    ];
  }
}

abstract class LoadingStateful<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
