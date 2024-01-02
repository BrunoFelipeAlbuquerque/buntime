FROM oven/bun:1

WORKDIR /usr/src/buntime

COPY bun/app/package.json .

RUN bun install

COPY bun/app/ .

EXPOSE 8080/tcp

CMD [ "bun", "run", "server.ts" ]
