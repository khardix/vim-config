#!/usr/bin/sh

# Script parameters
## URL of prebuilt clang binaries
CLANG_URL=""
[ $# -gt 0 ] && CLANG_URL="$1"

# Dir with unpacked prebuilt clang
CLANG_DIR="clang_prebuilt"

# Directory containing cmake source files
YCM_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )/bundle/YouCompleteMe/third_party/ycmd/cpp"

pushd "$(mktemp --directory)"

if [ "$CLANG_URL" ]; then # get prebuilt clang and use it for generating makefiles
  mkdir -p "$CLANG_DIR"
  wget "$CLANG_URL" -O - | tar -xJ --strip-components=1 -C "$CLANG_DIR"

  cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT="$CLANG_DIR" . "$YCM_DIR"
else # use system clang
  cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . "$YCM_DIR"
fi

ec=0
make ycm_support_libs || ec=$?

popd

exit $ec
