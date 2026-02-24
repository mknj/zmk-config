docker run -it --rm \
  --user $(id -u):$(id -g) \
  --security-opt label=disable \
  --workdir /workspaces/zmk \
  -v $PWD/zmk:/workspaces/zmk \
  -v $PWD:/workspaces/zmk-config \
  -v $PWD/modules:/workspaces/zmk-modules \
  -p 3000:3000 \
  docker.io/zmkfirmware/zmk-dev-arm:stable /bin/bash
