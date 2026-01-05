#include "CameraHandler.hpp"

int main() {
    // Membuat objek kamera dengan ID 0
    CameraHandler myCam(0);

    if (myCam.init()) {
        myCam.run();
    }

    return 0;
}