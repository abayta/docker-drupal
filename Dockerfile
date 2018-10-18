FROM webdevops/php-apache-dev:7.2

RUN apt-get update \
    && apt-get install -y mysql-client \
    && composer global require drush/drush:8.x

RUN ln -s $HOME/.composer/vendor/bin/drush /usr/bin/drush

COPY entrypoint /entrypoint.d/drush.sh
RUN chmod +x /entrypoint.d/drush.sh

COPY fix-permissions.sh /

