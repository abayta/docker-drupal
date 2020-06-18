FROM webdevops/php-apache-dev:7.2

RUN apt-get update \
    && apt-get install -y mysql-client nfs-common \
    && composer global require drush/drush:8.x

RUN ln -s $HOME/.composer/vendor/bin/drush /usr/bin/drush

ENV PHP_DEBUGGER none

RUN echo xdebug.remote_autostart = 0 >> /opt/docker/etc/php/php.ini
RUN echo xdebug.remote_enable = 0 >> /opt/docker/etc/php/php.ini
RUN echo xdebug.profiler_enable = 0 >> /opt/docker/etc/php/php.ini
RUN echo xdebug.remote_connect_back = 0 >> /opt/docker/etc/php/php.ini
RUN echo xdebug.profiler_enable_trigger = 0 >> /opt/docker/etc/php/php.ini

COPY entrypoint /entrypoint.d/drush.sh
RUN chmod +x /entrypoint.d/drush.sh

