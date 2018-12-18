## Quick Start

<p><b>WARNING!</b> Before you start, it is recommended that you have a good understanding of Pterodactyl and Docker. This Quick start will be going through with using docker-compose.</p>

First make sure that your docker build is up to date (At the time, this works on Docker CE 17.x). Clone/Download this repository to your local storage. You can do that by doing `git clone https://github.com/ccarney16/pterodactyl-docker pterodactyl`.


Rename the provided `.env.example` as `.env`. Use your favorite editor to change all the settings. It is strongly recommended to change the database passwords.

To initialize the panel, just run `bin/init`. During the configuration step, most settings set in .env will be displayed, modification is not needed.
Now login to the panel using the given URL provided in .env and set up the daemon.


Copy the configuration to `/srv/daemon/config/core.json`. Before starting the pterodactyl daemon, it is recommended to create the `pterodactyl_nw` network. That can be achieved by running `docker network create pterodactyl_nw`. Also make sure that the docker root is exposed to the daemon container, it is required for logging purposes.


Run `docker-compose up -d daemon` to complete setting up.


If you have any problems, refer to `docker-compose logs` to identify any issues.
You should be all set and rocking!

## Updating

Refer to https://docs.pterodactyl.io/ when updating to a newer version. `php artisan pterodactyl:env` and `php artisan pterodatyl:mail` are not required if you have the variables set outside of `/data/pterodactyl.conf`.

## Migrating

For users who are moving to a containerized platform, the `.env` file within the original panel installation should be copied to the data folder [`/data`] as `pterodactyl.conf`.

<p>Tweaking the config file (both .env and pterodactyl.conf) might be required</p>

## SSL Encryption

Set `SSL` to true in `.env` and provide SSL certificates. Let's Encrypt is also supported, just add in certbot from `docker-compose.extra.yml` and volumes to panel.

## Workers/cron in seperate container

While this container is able to run both the cron daemon and pterodactyl workers required for the panel to function correctly, they can be disabled in favor of running them in another container. Just set `DISABLE_WORKERS` to true and use the provided examples for seperate workers in `docker-compose.extra.yml`.