#include "CameraHandler.hpp"

CameraHandler::CameraHandler(int id) : deviceID(id) {}

CameraHandler::~CameraHandler() {
    cap.release();
    cv::destroyAllWindows();
    std::cout << "Kamera dilepas, memori dibersihkan." << std::endl;
}

bool CameraHandler::init() {
    cap.open(deviceID);
    if (!cap.isOpened()) {
        std::cerr << "Error: Tidak bisa membuka kamera!" << std::endl;
        return false;
    }
    return true;
}

void CameraHandler::run() {
    std::cout << "Menjalankan kamera... Tekan 'ESC' untuk berhenti." << std::endl;
    
    while (true) {
        cap >> frame; // Ambil frame terbaru
        if (frame.empty()) break;

        cv::imshow("Live Camera - OOP Mode", frame);

        // Berhenti jika menekan tombol ESC (ASCII 27)
        if (cv::waitKey(30) == 27) break;
    }
}