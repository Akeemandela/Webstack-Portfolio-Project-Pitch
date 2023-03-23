FROM node:12-alpine
WORKDIR /app
RUN rm package*.json
COPY APINaijaBlog/* ../ 
RUN npm install
EXPOSE 3000
CMD [ "npm", "run", "start-server"]

