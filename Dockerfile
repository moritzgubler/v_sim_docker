# Use an official Ubuntu base image
FROM ubuntu:22.04

# Set environment variables to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies required for building and running v_sim
RUN apt-get update && apt-get install -y build-essential autotools-dev automake autoconf libtool gtk-doc-tools intltool git gfortran libglib2.0-dev libgtk-3-dev libyaml-dev 

# Clone the v_sim repository
WORKDIR /v_sim
RUN git clone https://gitlab.com/l_sim/v_sim.git .

# Build v_sim from source
RUN ./autogen.sh \
    && ./configure \
    && make -j \
    && make install

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

ENV DISPLAY=:0

# RUN echo "xhost +local:root" > /etc/profile.d/x11.sh


RUN useradd -ms /bin/bash v_sim_user

# Set the working directory to the user's home directory
WORKDIR /home/v_sim_user

# Switch to the non-root user
USER v_sim_user

CMD ["/usr/local/bin/v_sim"]


