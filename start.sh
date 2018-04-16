currentdir="$(pwd)"
parentdir="$(dirname "$currentdir")"
sudo docker run -v "$parentdir":/home/god -it ewright362/dev_environment:latest bash
