
const double vatRate = 0.07;
double calcTotal({required int price, required int qty, double discount=0}){
  return (price*qty-discount)*(1+vatRate);
}
void main(){
  final String shopName = "Dart Cafe";

  print('ร้าน: $shopName');
  print('อัตราภาษี (vatRate): $vatRate');
  print('---');

  List<String> categories =['เครื่องดืม','ของคาว','ของหวาน'];
  Map<String,int> menu ={
    'ข้าวผัดไข่':60,
    'ก๋วยเตี๋ยวลูกชิ้นหมู':50,
    'กาแฟดำ':35,
    'น้ำแดงมะนาวโซดา':25
  };

  print('หมวดเมนู: $categories');
  print('จำนวนเมนูทั้งหมด: ${menu.length}');
  print('ราคากาแฟดำ: ${menu['กาแฟดำ']}');
  print('---');

  print('เมนูราคาตั้งแต่50บาทขึ้นไป');

  for (var entry in menu.entries){
    if (entry.value >= 50){
      print('${entry.key} : ${entry.value} บาท');
    }
  }
  print('---');
  double totalWithoutDiscount = calcTotal(price: 55,qty: 2);
  double totalWithoutDiscount2 = calcTotal(price: 55, qty: 2, discount: 10);
  print('ยอดรวมสุทธิ (ไม่มีส่วนลด): $totalWithoutDiscount บาท');
  print('ยอดรวมสุทธิ (ส่วนลด10บาท): $totalWithoutDiscount2 บาท');
  print('---');

  String? coupon;
  print('ความยาวคูปอง: ${coupon?.length??0}');
  coupon??= "NO-COUPON";
  print('คูปองหลังกำหนดค่า: $coupon');
}