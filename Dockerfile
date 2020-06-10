FROM klakegg/hugo:ext AS builder

COPY . /src
WORKDIR /src

ARG HUGO_BASEURL
ENV HUGO_BASEURL=${HUGO_BASEURL}

RUN hugo --minify
RUN ls

FROM nginx

COPY --from=builder /src/public /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

