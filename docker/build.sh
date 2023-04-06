docker run -it -d \
        --restart unless-stopped \
        --ipc host \
        --gpus all \
        --privileged \
        --shm-size=12gb \
        --net "host" \
        -v /home/${USER}/Dataset:/home/user/dataset:rw \
        -v /home/${USER}/SHINE_mapping:/home/user/SHINE_mapping:rw \
        --name shine \
        shine:latest