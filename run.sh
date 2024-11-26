
# run and map current directory to /home/v_sim_user which is the working directory to pass command line arguments
docker run --rm -it -v $PWD:/home/v_sim_user -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY v_sim_image v_sim 1.xyz

# run and map home directory to /home/v_sim_user
docker run --rm -it -v $HOME:/home/v_sim_user -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY v_sim_image

# log in to the container
docker run --rm -it -v $PWD:/home/v_sim_user -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY v_sim_image /bin/bash

# xhost permissions
xhost +local:$(whoami)

# remove permissions
xhost -local:$(whoami)