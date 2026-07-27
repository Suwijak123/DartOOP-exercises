
abstract class PaymentProcessor {
  bool pay(double amount);
  String getReceipt();
}


class PromptPayProcessor implements PaymentProcessor {
  String phoneNumber;
  
  PromptPayProcessor(this.phoneNumber);

  @override
  bool pay(double amount) {
    print("📱 กำลังสร้างคิวอาร์โค้ดพร้อมเพย์สำหรับ $phoneNumber...");
    print("💸 ได้รับเงินจำนวน ฿$amount ผ่านคิวอาร์โค้ดเรียบร้อยแล้ว");
    return true;
  }

  @override
  String getReceipt() {
    return "ใบเสร็จ: โอนเงินผ่านพร้อมเพย์";
  }
}


class CoinSlotProcessor implements PaymentProcessor {
  double coinsInserted;

  CoinSlotProcessor(this.coinsInserted);

  // TODO 1
  @override
  bool pay(double amount) {
    if (coinsInserted >= amount) {
      print("🪙 รับชำระเงินด้วยเหรียญจำนวน ฿$amount");
      return true;
    } else {
      print("❌ หยอดเหรียญไม่พอ");
      return false;
    }
  }

  // TODO 2
  @override
  String getReceipt() {
    return "ใบเสร็จ: ชำระเงินผ่านช่องหยอดเหรียญ";
  }
}

void main() {
  double laundryFee = 40.0;
  
  print("=== ผู้ใช้เลือกชำระผ่านพร้อมเพย์ ===");
  
  PaymentProcessor method1 = PromptPayProcessor("081-234-5678");
  method1.pay(laundryFee);
  print(method1.getReceipt());

  print("\n=== ผู้ใช้เลือกหยอดเหรียญ ===");
  // TODO 3
  
  PaymentProcessor method2 = CoinSlotProcessor(50.0);
  
 
  bool isPaid = method2.pay(laundryFee);
  if (isPaid) {
    print(method2.getReceipt());
  }
}