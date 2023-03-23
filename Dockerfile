FROM node:12-alpine
WORKDIR /app
COPY APINaijaBlog/package*.json ./ 
RUN npm install --prefix APINaijaBlog
COPY APINaijaBlog/ ./APINaijaBlog
EXPOSE 3000
CMD [ "npm", "run", , "start-server", "--prefix", "APINaijaBlog" ]

