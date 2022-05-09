FROM alpine:latest AS alpine
ENV LANG C.UTF-8

COPY . /blog

RUN apk update && apk add hugo \
  && cd /blog/hugo-blog && hugo

FROM nginx:alpine AS nginx
ENV LANG C.UTF-8

COPY nginx/ /etc/nginx/conf.d/

COPY --from=alpine /blog/hugo-blog/public/ /usr/share/nginx/blog/