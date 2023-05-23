@echo off

call "C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat"

SET includes=/Isrc /I%VULKAN_SDK%/Include /I"C:/Libraries/GLFW/include" /I"C:/Libraries/glm"

:: user32.lib Shell32.lib
SET links=/link /LIBPATH:%VULKAN_SDK%/Lib /LIBPATH:"C:/Libraries/GLFW/lib-vc2022" user32.lib Shell32.lib gdi32.lib glfw3_mt.lib vulkan-1.lib

SET defines=/D DEBUG

echo "Building shaders..."

SET shader_path=assets/shaders

C:/Libraries/VulkanSDK/1.3.243.0/Bin/glslc.exe %shader_path%/shader.vert -o %shader_path%/vert.spv
C:/Libraries/VulkanSDK/1.3.243.0/Bin/glslc.exe %shader_path%/shader.frag -o %shader_path%/frag.spv

echo "Building main..."

cl /EHsc /std:c++17 %includes% %defines% src/main.cpp %links% 