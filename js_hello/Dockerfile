# Use an official Node.js runtime as a parent image
FROM node:14-alpine
WORKDIR /app
COPY . /app
EXPOSE 8080
## bad 
# CMD node server.js
CMD ["node", "server.js"]
