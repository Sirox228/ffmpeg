# Compiles FFmpeg for Windows 64-bit using MSYS2
# https://trac.ffmpeg.org/wiki/CompilationGuide/MinGW

FLAGS=""

# Disable the features we don't want or use to reduce compile times.
FLAGS="$FLAGS --disable-doc"
FLAGS="$FLAGS --disable-programs"

# Direct build logs to a file.
FLAGS="$FLAGS --logfile=../build.log"
# Upgrade license to LGPLv3, allowing use of some ApacheV2 licensed dependencies.
FLAGS="$FLAGS --enable-version3"

# Add HTTPS support.
#FLAGS="$FLAGS --enable-openssl"
#FLAGS="$FLAGS --enable-libvpx"

# Add x86-specific flags here.
flags="$flags --arch=x86"
FLAGS="$FLAGS --toolchain=msvc"
FLAGS="$FLAGS --enable-static"

pushd ffmpeg
./configure $FLAGS && make
popd

# Export the necessary binaries.
mkdir -p win32/
cp -f ffmpeg/libavcodec/libavcodec.a win32/avcodec.lib
cp -f ffmpeg/libavformat/libavformat.a win32/avformat.lib
cp -f ffmpeg/libavutil/libavutil.a win32/avutil.lib
cp -f ffmpeg/libavdevice/libavdevice.a win32/avdevice.lib
cp -f ffmpeg/libavfilter/libavfilter.a win32/avfilter.lib
cp -f ffmpeg/libswresample/libswresample.a win32/swresample.lib
cp -f ffmpeg/libswscale/libswscale.a win32/swscale.lib