FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
ENV NODE_OPTIONS=--openssl-legacy-provider

# Accept build arguments
ARG REACT_APP_POSTS_SERVICE_URL
ARG REACT_APP_COMMENTS_SERVICE_URL
ARG REACT_APP_QUERY_SERVICE_URL

# Set as environment variables for React build
ENV REACT_APP_POSTS_SERVICE_URL=$REACT_APP_POSTS_SERVICE_URL
ENV REACT_APP_COMMENTS_SERVICE_URL=$REACT_APP_COMMENTS_SERVICE_URL
ENV REACT_APP_QUERY_SERVICE_URL=$REACT_APP_QUERY_SERVICE_URL

COPY ./ ./
RUN npm run build

FROM nginxinc/nginx-unprivileged:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


