FROM nginx:1.15.2

ARG HTTP_PORT
ARG HTTPS_PORT
ARG SNIPE_FQDN

ENV HTTP_PORT "$HTTP_PORT"
ENV HTTPS_PORT "$HTTPS_PORT"
ENV SNIPE_FQDN "$SNIPE_FQDN"

COPY conf.d/default.conf default.conf

RUN mv default.conf /etc/nginx/conf.d/default.conf && \
    sed -i 's|SUBSTITUTE_REAL_HTTP_PORT|'"$HTTP_PORT"'|g' \
  /etc/nginx/conf.d/default.conf && \
    sed -i 's|SUBSTITUTE_REAL_HTTPS_PORT|'"$HTTPS_PORT"'|g' \
  /etc/nginx/conf.d/default.conf && \
    sed -i 's|SNIPE_FQDN|'"$SNIPE_FQDN"'|g' \
  /etc/nginx/conf.d/default.conf
EXPOSE $HTTP_PORT/tcp
EXPOSE $HTTPS_PORT/tcp