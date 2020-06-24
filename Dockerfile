FROM ruby:2.5.3-alpine

RUN apk add --no-cache build-base postgresql postgresql-dev nodejs yarn git

RUN mkdir /beetrack-v2
WORKDIR /beetrack-v2