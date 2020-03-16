FROM node:alpine as build_stage
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=build_stage /usr/app/build /usr/share/nginx/html