cmake_minimum_required(VERSION 3.16)

project(qt_quick_3_7 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS QuickControls2)

qt_add_executable(appqt_quick_3_7
    main.cpp
)

qt_add_qml_module(appqt_quick_3_7
    URI qt_quick_3_7
    VERSION 1.0
    QML_FILES main.qml
)
qt_add_resources(appqt_quick_3_7 "app_images"
    PREFIX "/"
    FILES
        images/le.png
        images/open.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appqt_quick_3_7 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appqt_quick_3_7
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqt_quick_3_7 PRIVATE Qt6::Quick)
target_link_libraries(appqt_quick_3_7 PRIVATE Qt6::QuickControls2)

include(GNUInstallDirs)
install(TARGETS appqt_quick_3_7
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
