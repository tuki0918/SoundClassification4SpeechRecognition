FROM python:3.6-onbuild

######################
# ffmpeg install

RUN cd /tmp \
    && git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg \
    && cd ffmpeg \
    && ./configure \
        --disable-debug \
        --disable-x86asm \
        --disable-gpl \
        --enable-nonfree \
    && make install

######################
