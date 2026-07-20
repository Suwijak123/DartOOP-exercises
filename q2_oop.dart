abstract class Menuitem{
  final String name;
  final double basePrice;

  static int itemCount = 0;

  Menuitem(this.name, this.basePrice){
    itemCount ++;
  }

  double price();

  void show(){
    print('$name-$price บาท');
  }
}
class Drink extends Menuitem{
  int toppings;

  Drink(String name, double basePrice, this.toppings) : super(name, basePrice);

  @override
  double price(){
    return basePrice + (10 * toppings);
  }
}
class Food extends Menuitem{
  String size;

  Food(String name, double basePrice, this.size) : super(name, basePrice);

  @override
  double price(){
    double multiplier;

    switch(size){
      case 'S':
      multiplier = 1.0;
      break;
      case 'M':
      multiplier = 1.2;
      break;
      case 'L':
      multiplier = 1.5;
      break;
      default:
      multiplier = 1.0;

    }
    return basePrice * multiplier;
  }
}
class Wallet {
double _balance = 0.0;

double get balance => _balance;


set balance(double value) {
    if (value < 0) {
      print('ผิดพลาด: ยอดเงินติดลบไม่ได้');
    } else {
      _balance = value;
    }
  }

bool pay(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
      print('ชำระเงินสำเร็จ');
      return true;
    } else {
      print('ยอดเงินไม่พอ');
      return false;
    }
  }
}

enum OrderStatus { pending, paid, cancelled }

String getThaiStatus(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return 'รอชำระเงิน';
    case OrderStatus.paid:
      return 'ชำระเงินแล้ว';
    case OrderStatus.cancelled:
      return 'ยกเลิกคำสั่งซื้อ';
  }
}

void main() {
  List<Menuitem> order = [
    Drink('กาแฟดำ', 35.0, 2),      
    Food('ข้าวผัดไข่', 60.0, 'M'),     
    Drink('น้ำแดงมะนาวโซดา', 25.0, 0),  
  ];

  double totalAmount = 0.0;
  for (var item in order) {
    item.show();
    totalAmount += item.price();
  }
  print('ยอดรวมทั้งสิ้น: $totalAmount บาท');

  print('---');
  Wallet wallet = Wallet();
  wallet.balance = 300.0; 

  wallet.balance = -50.0;

  if (wallet.pay(totalAmount)) {
    print('สถานะ: ${getThaiStatus(OrderStatus.paid)}');
    print('ยอดคงเหลือ: ${wallet.balance} บาท');
  }

  if (!wallet.pay(150.0)) {
    print('สถานะ: ${getThaiStatus(OrderStatus.pending)}');
    print('ยอดคงเหลือ: ${wallet.balance} บาท');
  }
  print('---');
  print('จำนวนรายการเมนูที่ถูกสร้าง: ${Menuitem.itemCount}');
}