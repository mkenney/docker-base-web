Simple docker-compose example

```
web:
    image: mkenney/base-web:latest
    container_name: mkenney-base-web
    ports:
        - "80"
    hostname: mkenney-base-web
    volumes:
        - .:/var/www/html/
        - /etc/localtime:/etc/localtime:ro
    environment:
        - server_env=dev
        - is_docker=1
        - DOCUMENTROOT_PATH=/var/www/html/documentroot # Configurable, defaults to
                                                       # /var/www/html/documentroot
        - VIRTUAL_HOST=base-web.michaelkenney.us # Used in the vhost config and can also
                                                 # be used by the mkenney/reverse-proxy
                                                 # service
```
