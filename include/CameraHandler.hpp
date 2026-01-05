#pragma once
#include <opencv2/opencv.hpp>
#include <iostream>

class CameraHandler {
private:
    cv::VideoCapture cap;
    cv::Mat frame;
    int deviceID;

public:
    // Constructor
    CameraHandler(int id = 0);
    
    // Destructor (Otomatis lepas kamera saat program selesai)
    ~CameraHandler();

    bool init();
    void run();
};