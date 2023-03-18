FROM ruby:2.7.2-alpine

ENV LANG ja_JP.UTF-8

RUN apk update && apk --no-cache --update add \

# /opt/project for RubyMine debugging
RUN mkdir /opt/project
WORKDIR /opt/project

RUN mkdir -p /usr/share/fonts/ipa
ADD ./app/assets/fonts/ipaexg.ttf /usr/share/fonts/ipa/
RUN fc-cache -fv
