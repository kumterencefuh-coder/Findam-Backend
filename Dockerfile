FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY src ./src
COPY data ./data
RUN mkdir -p uploads
ENV NODE_ENV=production PORT=4000 DATA_FILE=/app/data/db.json
EXPOSE 4000
CMD ["node", "src/server.js"]
