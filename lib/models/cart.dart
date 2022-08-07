// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:project1/core/store.dart';
import 'package:project1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {

  

  late CatalogModel _catalog;
  

  final List<int> _ItemIds =[];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    _catalog= newCatalog;
  }



  List<Item> get items => _ItemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice => items.fold(0,(total,current)=> total+ current.price);

  

  
}

class AddMutation extends VxMutation<MyStore>{
  late final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._ItemIds.add(item.id);
  }

}

class RemoveMutation extends VxMutation<MyStore>{
  late final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._ItemIds.remove(item.id);
  }

}
