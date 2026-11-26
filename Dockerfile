FROM node:20-bookworm-slim

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci
RUN npx playwright install --with-deps chromium

COPY . .

ENTRYPOINT ["npx", "playwright-cli"]
CMD ["--help"]
