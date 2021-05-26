FROM node:13.3.0 AS compile-image
WORKDIR /opt/ng COPY .npmrc package.json yarn.lock ./
RUN npm install
COPY . ./ RUN ng build --prod
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf COPY --from=compile-image /opt/ng/dist/frontend /usr/share/nginx/html