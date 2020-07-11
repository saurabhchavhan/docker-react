From node:alpine as builder
WORKDIR "/App"
COPY package.json .
RUN npm install
COPY . .
RUN npm run builder
From nginx
COPY --from=builder /app/build /usr/share/nginx/html
