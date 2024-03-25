FROM oven/bun:1

WORKDIR /usr/src/app

COPY package.json ./
COPY tsconfig.json ./
COPY bun.lockb ./

RUN bun install

COPY /code .

EXPOSE 8080

CMD [ "bun", "run", "dev" ]