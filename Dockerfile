FROM mysql:5.7.24

# SET timezone to 'Asia/Shanghai'
ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone

# preconfigure the variables: explicit_defaults_for_timestamp, skip-name-resolve ...
COPY ./my.cnf /etc/mysql/my.cnf

# refer to https://github.com/docker-library/mysql/blob/7397711170daed7ebba3bf373af143e5179906fc/5.7/Dockerfile
EXPOSE 3306 33060

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]