import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/202/image_learn_202.dart';
import 'package:flutter_hardware_andro/303/reqres_resources/service/reqres_service.dart';
import 'package:flutter_hardware_andro/303/reqres_resources/view_model/reqres_provider.dart';
import 'package:flutter_hardware_andro/product/extension/global/resource_context.dart';
import 'package:flutter_hardware_andro/product/extension/global/theme_notifier.dart';
import 'package:flutter_hardware_andro/product/extension/string_extension.dart';
import 'package:flutter_hardware_andro/product/service/project_network_manager.dart';
import 'package:provider/provider.dart';

import '../model/resources_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({Key? key}) : super(key: key);

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

//class _ReqresViewState extends ReqresViewModel {
class _ReqresViewState extends State<ReqresView> with ProjectNetworkManagerMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: ((context) => ReqresProvider(ReqresService(service))),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              return context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
            title: context.watch<ReqresProvider>().isLoading ? const CircularProgressIndicator() : null,
            actions: const [_SaveAndNavigateWidget()],
          ),
          body: Column(
            children: [
              const _TempyPlaceholder(),
              Expanded(child: _resourceListView(context, context.watch<ReqresProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: ((context, index) {
          return Card(color: Color(items[index].color?.colorValue ?? 0), child: Text(items[index].name ?? ''));
        }));
  }
}

class _SaveAndNavigateWidget extends StatelessWidget {
  const _SaveAndNavigateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.save_alt_outlined),
        onPressed: () {
          context.read<ReqresProvider>().saveToLocale(context.read<ResourceContext>());
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const ImageLearn202();
          }));
        });
  }
}

class _TempyPlaceholder extends StatelessWidget {
  const _TempyPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ReqresProvider, bool>(builder: ((context, value, child) {
      return value ? const Placeholder() : const Text('data');
    }), selector: (context, provider) {
      return provider.isLoading;
    });
  }
}
