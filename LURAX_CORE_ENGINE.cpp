#include <iostream>
#include <string>
#include <vector>
#include <windows.h> // Untuk Sleep & Color

using namespace std;

// --- DATABASE LOGIC ---
struct Mission {
    string uuid;
    string objective;
    string status;
};

class LuraxCommander {
public:
    void BootSystem() {
        system("cls");
        system("color 0C"); // Set terminal warna merah hitam
        cout << "===========================================" << endl;
        cout << "   LURAX VIP | SUPREME KERNEL v6.0         " << endl;
        cout << "===========================================" << endl;
        cout << " [!] STATUS: CONNECTING TO ID-WEST-01..." << endl;
        Sleep(1000);
        cout << " [!] BYPASSING MAGIC PROTECTION... [OK]" << endl;
        cout << " [!] SYNCING WITH WEB DASHBOARD... [OK]" << endl;
        cout << "-------------------------------------------" << endl;
    }

    void Execute(string task, int qty) {
        cout << "\n [>] STARTING MISSION: " << task << endl;
        cout << " [>] TARGET QUANTITY: " << qty << " STARS/TIER" << endl;
        
        for(int i = 0; i <= 100; i += 25) {
            cout << " [PROC] Processing Core Data... " << i << "%" << endl;
            Sleep(500);
        }
        cout << " [!] SUCCESS: MISSION INJECTED TO SERVER." << endl;
    }

    void ShowSQL() {
        cout << "\n >> LIVE_TRANSACTIONS.SQL FETCHED:" << endl;
        cout << " 1. 0x8F2D-VIP | MLBB IMMORTAL | EXECUTING" << endl;
        cout << " 2. 0x3E11-VIP | BS LEGEND     | SUCCESS" << endl;
        cout << " 3. 0xV92K-VIP | MYTHIC x20    | SUCCESS" << endl;
    }
};

int main() {
    LuraxCommander caleb;
    caleb.BootSystem();
    caleb.Execute("MLBB IMMORTAL", 100);
    caleb.ShowSQL();

    cout << "\n-------------------------------------------" << endl;
    cout << " SYSTEM SECURED. PRESS ENTER TO STANDBY." << endl;
    cin.get();
    return 0;
}
