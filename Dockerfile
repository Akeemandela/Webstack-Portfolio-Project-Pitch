FROM node:12-alpine
WORKDIR /app
COPY APINaijaBlog/package*.json ./ 
RUN npm install --prefix APINaijaBlogcd
COPY APINaijaBlog/ ./APINaijaBlog
EXPOSE 3000
CMD [ "npm", "start", "--prefix", "APINaijaBlog" ]

