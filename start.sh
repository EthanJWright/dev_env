currentdir="$(pwd)"
parentdir="$(dirname "$currentdir")"
sudo docker run -v "$parentdir":/mount -it ewright362/dev_environment:latest bash
