# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.22.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.22.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/nyholku/jCAE/occjava3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/nyholku/jCAE/occjava3

# Include any dependencies generated for this target.
include CMakeFiles/OccJava.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/OccJava.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/OccJava.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/OccJava.dir/flags.make

CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.o: CMakeFiles/OccJava.dir/flags.make
CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.o: src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx
CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.o: CMakeFiles/OccJava.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/nyholku/jCAE/occjava3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.o -MF CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.o.d -o CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.o -c /Users/nyholku/jCAE/occjava3/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx

CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/nyholku/jCAE/occjava3/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx > CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.i

CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/nyholku/jCAE/occjava3/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx -o CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.s

CMakeFiles/OccJava.dir/src/jnistream.cxx.o: CMakeFiles/OccJava.dir/flags.make
CMakeFiles/OccJava.dir/src/jnistream.cxx.o: src/jnistream.cxx
CMakeFiles/OccJava.dir/src/jnistream.cxx.o: CMakeFiles/OccJava.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/nyholku/jCAE/occjava3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/OccJava.dir/src/jnistream.cxx.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/OccJava.dir/src/jnistream.cxx.o -MF CMakeFiles/OccJava.dir/src/jnistream.cxx.o.d -o CMakeFiles/OccJava.dir/src/jnistream.cxx.o -c /Users/nyholku/jCAE/occjava3/src/jnistream.cxx

CMakeFiles/OccJava.dir/src/jnistream.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OccJava.dir/src/jnistream.cxx.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/nyholku/jCAE/occjava3/src/jnistream.cxx > CMakeFiles/OccJava.dir/src/jnistream.cxx.i

CMakeFiles/OccJava.dir/src/jnistream.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OccJava.dir/src/jnistream.cxx.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/nyholku/jCAE/occjava3/src/jnistream.cxx -o CMakeFiles/OccJava.dir/src/jnistream.cxx.s

# Object files for target OccJava
OccJava_OBJECTS = \
"CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.o" \
"CMakeFiles/OccJava.dir/src/jnistream.cxx.o"

# External object files for target OccJava
OccJava_EXTERNAL_OBJECTS =

libOccJava.jnilib: CMakeFiles/OccJava.dir/src-java/org/jcae/opencascade/jni/OccJavaJAVA_wrap.cxx.o
libOccJava.jnilib: CMakeFiles/OccJava.dir/src/jnistream.cxx.o
libOccJava.jnilib: CMakeFiles/OccJava.dir/build.make
libOccJava.jnilib: /usr/local/lib/libTKIGES.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKOffset.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKSTEP.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKFillet.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKMesh.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKBool.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKBO.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKPrim.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKSTEPAttr.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKSTEP209.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKSTEPBase.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKXSBase.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKShHealing.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKTopAlgo.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKGeomAlgo.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKBRep.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKGeomBase.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKG3d.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKG2d.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKMath.7.5.0.dylib
libOccJava.jnilib: /usr/local/lib/libTKernel.7.5.0.dylib
libOccJava.jnilib: CMakeFiles/OccJava.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/nyholku/jCAE/occjava3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared module libOccJava.jnilib"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/OccJava.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/OccJava.dir/build: libOccJava.jnilib
.PHONY : CMakeFiles/OccJava.dir/build

CMakeFiles/OccJava.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/OccJava.dir/cmake_clean.cmake
.PHONY : CMakeFiles/OccJava.dir/clean

CMakeFiles/OccJava.dir/depend:
	cd /Users/nyholku/jCAE/occjava3 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/nyholku/jCAE/occjava3 /Users/nyholku/jCAE/occjava3 /Users/nyholku/jCAE/occjava3 /Users/nyholku/jCAE/occjava3 /Users/nyholku/jCAE/occjava3/CMakeFiles/OccJava.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/OccJava.dir/depend
