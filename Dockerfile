FROM node:22-alpine
WORKDIR /app

RUN apk add --no-cache unzip

COPY ComunicAi_PRONTO_PARA_USAR.zip /tmp/comunicai.zip
RUN unzip -q /tmp/comunicai.zip -d /tmp/comunicai \
    && cp -R /tmp/comunicai/ComunicAi/. /app/ \
    && rm -rf /tmp/comunicai /tmp/comunicai.zip \
    && npm install --omit=dev

ENV NODE_ENV=production
EXPOSE 10000

CMD ["node", "server.js"]
