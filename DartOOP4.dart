// 1. มิกซ์อิน (THE MIXIN)
// มิกซ์อินช่วยให้เรานำโค้ดไปใช้ซ้ำในคลาสอื่นๆ ได้โดยไม่ต้องสืบทอด (extends)
mixin CloudLogger {
  void logToCloud(String message) {
    // ในแอปจริง โค้ดส่วนนี้จะส่งข้อมูลไปยังระบบฐานข้อมูล เช่น Firebase
    print("☁️ [Cloud Log]: $message");
  }
}

// 2. คลาสแบบเจเนอริกส์ (THE GENERIC CLASS)
// <T> ย่อมาจาก "Type" ทำให้คลาสนี้สามารถเก็บข้อมูลชนิดใดก็ได้ (String, int, ฯลฯ)
// สังเกตการใช้ 'with CloudLogger' เพื่อนำฟังก์ชันจากมิกซ์อินมาใช้งาน!
class AppDataCache<T> with CloudLogger { 
  T? cachedData; // T? หมายความว่าตัวแปรนี้อาจเก็บข้อมูลชนิด T หรือเป็น null ก็ได้

  // TODO 1: สร้างเมธอดชื่อ 'saveData' ที่รับพารามิเตอร์ชื่อ 'newData' ชนิด T
  // - กำหนดค่าให้ cachedData = newData;
  // - เรียกใช้ logToCloud() จากมิกซ์อิน โดยส่งข้อความ "บันทึกข้อมูลแล้ว: $cachedData"
  void saveData(T newData) {
    cachedData = newData;
    logToCloud("บันทึกข้อมูลแล้ว: $cachedData");
  }

  // TODO 2: สร้างเมธอดชื่อ 'clearData' (ไม่มีพารามิเตอร์)
  // - กำหนดค่าให้ cachedData = null;
  // - เรียกใช้ logToCloud() โดยส่งข้อความ "ล้างข้อมูลในแคชแล้ว"
  void clearData() {
    cachedData = null;
    logToCloud("ล้างข้อมูลในแคชแล้ว");
  }
}

void main() {
  print("=== กำลังแคชข้อมูลแบบสตริง (User Token) ===\n");

  AppDataCache<String> tokenCache = AppDataCache<String>();

  // TODO 3: เรียกใช้ saveData() และส่งข้อความโทเค็น เช่น "ABC-123"
  tokenCache.saveData("ABC-123");

  // TODO 4: เรียกใช้ clearData()
  tokenCache.clearData();

  print("\n=== กำลังแคชข้อมูลแบบตัวเลข (High Score) ===\n");

  // TODO 5: สร้าง AppDataCache ขึ้นมาใหม่ แต่คราวนี้ระบุชนิดเป็น <int> และตั้งชื่อตัวแปรว่า 'scoreCache'
  AppDataCache<int> scoreCache = AppDataCache<int>();

  // TODO 6: เรียกใช้ saveData() บน scoreCache และส่งตัวเลขคะแนน เช่น 9999
  scoreCache.saveData(9999);
}