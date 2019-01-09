FROM nginx:1.15.2

ARG HTTP_PORT
ARG HTTPS_PORT
ARG DNS_NAME

ENV HTTP_PORT "$HTTP_PORT"
ENV HTTPS_PORT "$HTTPS_PORT"
ENV DNS_NAME "$DNS_NAME"

COPY conf.d/default.conf default.conf

RUN mv default.conf /etc/nginx/conf.d/default.conf

RUN sed -i 's|SUBSTITUTE_REAL_HTTP_PORT|'"$HTTP_PORT"'|g' \
  /etc/nginx/conf.d/default.conf

RUN sed -i 's|SUBSTITUTE_REAL_HTTPS_PORT|'"$HTTPS_PORT"'|g' \
  /etc/nginx/conf.d/default.conf

RUN sed -i 's|DNS_NAME|'"$DNS_NAME"'|g' \
  /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install nano

EXPOSE $HTTP_PORT/tcp
EXPOSE $HTTPS_PORT/tcp