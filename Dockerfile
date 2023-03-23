FROM node:12-alpine
WORKDIR /app
COPY APINaijaBlog/ ./ 
RUN npm install
EXPOSE 3000
CMD [ "npm", "run", "start-server"]

