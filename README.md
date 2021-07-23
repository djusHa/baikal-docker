# Baikal Server on Docker with Alpine Image

1. clone or download the repo
2. change into `build` folder
3. build the Image with `docker build -t $USER/baikal:latest .`
4. adopt the `.env` File in Root Folder with your Passwords
5. rename `docker-compose.mariadb.yml` or `docker-compose.sqlite.yml` to `docker-compose.yml`
6. run `docker-compose up -d`
7. login on `http://youripaddress:8096` to start Setup

Further Infos:

[Anleitung](https://github.com/JsBergbau/BaikalAnleitung)

[Project Github](https://github.com/sabre-io/Baikal)

[Projects Website](https://sabre.io/baikal/)
