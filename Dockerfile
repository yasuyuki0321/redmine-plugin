FROM public.ecr.aws/docker/library/redmine:latest

RUN apt update; \
    apt install -y \
        locales \
        imagemagick \
        libmagickwand-dev

RUN sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen; \
    locale-gen
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
