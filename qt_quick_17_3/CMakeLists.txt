cmake_minimum_required(VERSION 3.16)

project(qt_quick_17_3 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appqt_quick_17_3
    main.cpp
    dynamicentrymodel.h
    dynamicentrymodel.cpp
)
qt_add_resources(appqt_quick_17_3 "app_images"
    PREFIX "/"
    FILES
        images/remove.png
)
qt_add_qml_module(appqt_quick_17_3
    URI qt_quick_17_3
    VERSION 1.0
    QML_FILES main.qml
    QML_FILES ListDelegate.qml
    QML_FILES Background.qml
    QML_FILES ListHighlight.qml
    QML_FILES TextEntry.qml

)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appqt_quick_17_3 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appqt_quick_17_3
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqt_quick_17_3
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appqt_quick_17_3
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
