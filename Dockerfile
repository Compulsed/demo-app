# Improvements:
# 1. Only use dist in final image (multi-stage build)
#   - Only use the built dependencies
#   - Have nodejs as a single binary
# 2. Lock down the node version further to be 20.X -- 
#   - Distroless
# 3. Live reloading for good development experience (nodemon, bind mounts)
# 4. Docker compose to make it easier to work with
# 5. Not use root user
# 6. NODE_ENV environment variable
FROM node:20

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

EXPOSE 80

CMD ["npm", "start"]


