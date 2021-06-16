import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
class CartDatabaseHelper{
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database _database;

  Future<Database> get database async{
    if(_database != null ) return _database;
    _database = await initDb();
    return _database;
  }

  initDb()async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(''' 
        Create table $tableCartProduct(
        $columnName Text not null,
        $columnImage Text not null,
        $columnQuantity Text not null,
        $columnPrice Integer not null,
        $columnProductId Text not null)
        ''');
        });
  }

  Future<List<CartProductModel>>getAllProduct()async{
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableCartProduct);

    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];

    return list;
  }

  insert(CartProductModel model) async
  {
    var dbClient = await database;
    await dbClient.insert(
        tableCartProduct,
        model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}