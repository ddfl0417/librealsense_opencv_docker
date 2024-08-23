FROM nvidia/cudagl:11.3.0-devel-ubuntu20.04

ENV TZ=US/Pacific
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y curl

RUN mkdir -p /etc/apt/keyrings
RUN curl -sSf https://librealsense.intel.com/Debian/librealsense.pgp | tee /etc/apt/keyrings/librealsense.pgp > /dev/null

RUN echo "deb [signed-by=/etc/apt/keyrings/librealsense.pgp] https://librealsense.intel.com/Debian/apt-repo focal main" | \
    tee /etc/apt/sources.list.d/librealsense.list > /dev/null
RUN apt-get update

RUN apt-get install -y librealsense2-dkms 
RUN apt-get install -y librealsense2-utils
RUN apt-get install -y librealsense2-dev
RUN apt-get install -y librealsense2-dbg

RUN apt-get install -y python3-pip
RUN pip install opencv-python opencv-contrib-python

# Shows a list of connected Realsense devices
CMD [ "rs-enumerate-devices", "--compact" ]