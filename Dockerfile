From node:alpine
WORKDIR "/App"
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
From nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
