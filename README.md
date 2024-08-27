# Handwriting Labeling App
This project is used as a simple way of deploying [backend](https://github.com/LukasPieger1/handwriting-labeling-app-backend) and [frontend](https://github.com/LukasPieger1/handwriting-labeling-app-frontend) of the handwriting labeling app along with a database to the same server as docker-containers.

## Building the project
1. After cloning the project run `git submodule update --init` to fetch content of the submodules.
2. Run `provide-defaults.sh` to generate default environment in `.env`.
3. Adjust `.env` and `config/batch_service_config.json` to your needs.
4. Copy example/sample files into their respective directories (The content of these directories needs to follow the structure specified in the README.md-file in the [backend-project](https://github.com/LukasPieger1/handwriting-labeling-app-backend)).
5. To build and run everything as docker-containers on your machine execute the following command: 
```bash
  docker-compose build && docker-compose up -d
```


Hint: After the first manual setup, the `update_and_restart.sh` script automatically deploys the latest version of this project.
If you want this script to also update your provided image-files you will need to adjust the `_update_files.sh`-script that is created by `provide-defaults.sh`