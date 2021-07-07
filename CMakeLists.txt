cmake_minimum_required(VERSION 3.14)

project(atividade2 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(Qt5QuickWidgets, "C:/Qt/5.15.2/mingw81_32/lib/cmake/Qt5QuickWidgets")
set(Qt5Qml = "C:/Qt/5.15.2/mingw81_32/lib/cmake/Qt5Qml")
set(Qt5QmlImportScanner "C:/Qt/5.15.2/mingw81_32/lib/cmake/Qt5QmlImportScanner")
set(Qt5Core "C:/Qt/5.15.2/mingw81_32/lib/cmake/Qt5Core")
set(SKIP_AUTOMOC "main.cpp")

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check https://doc.qt.io/qt/deployment-android.html for more information.
# They need to be set before the find_package(...) calls below.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick REQUIRED)

find_package(QT NAMES Qt6 Qt5 COMPONENTS Qt5QuickWidgets )
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Qt5QuickWidgets )

find_package(QT NAMES Qt6 Qt5 COMPONENTS Qt5Qml )
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Qt5Qml )

find_package(QT NAMES Qt6 Qt5 COMPONENTS Qt5QmlImportScanner)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Qt5QmlImportScanner)

find_package(QT NAMES Qt6 Qt5 COMPONENTS Qt5Core )
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Qt5Core )

set(PROJECT_SOURCES
        main.cpp
        PlayerGenerator.cpp
        PlayerGenerator.h
        qml.qrc
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(atividade2
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )
else()
    if(ANDROID)
        add_library(atividade2 SHARED
            ${PROJECT_SOURCES}
        )
    else()
        add_executable(atividade2
          ${PROJECT_SOURCES}
        )
    endif()
endif()

target_compile_definitions(atividade2
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(atividade2
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick)

target_link_libraries(atividade2
  INTERFACE Qt${QT_VERSION_MAJOR}::Qt5QuickWidgets)

target_link_libraries(atividade2
  INTERFACE Qt${QT_VERSION_MAJOR}::Qt5Qml)

target_link_libraries(atividade2
  INTERFACE Qt${QT_VERSION_MAJOR}::Qt5QmlImportScanner)

target_link_libraries(atividade2
  INTERFACE Qt${QT_VERSION_MAJOR}::Qt5Core)

set_target_properties(atividade2 PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
)

if(QT_VERSION_MAJOR EQUAL 6)
    qt_import_qml_plugins(atividade2)
    qt_finalize_executable(atividade2)
endif()
