FROM webdevops/php-apache-dev:7.2

RUN apt-get update \
    && apt-get install -y vim \
    && apt-get install -y mysql-client \
    && composer global require drush/drush:8.x \
    && su application -c 'composer global require drush/drush:8.x'

RUN ln -s $HOME/.composer/vendor/bin/drush /usr/bin/drush

COPY entrypoint /bin/entrypoint
RUN chmod +x /bin/entrypoint

ENTRYPOINT [ "/bin/entrypoint"]