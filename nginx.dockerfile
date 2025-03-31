# Use the lightweight nginx base image on Alpine
FROM nginx:alpine

# Install Certbot and the Nginx plugin from Alpine's repositories
RUN apk add --no-cache certbot certbot-nginx

# Create necessary directories for webroot and certificate storage
RUN mkdir -p /etc/letsencrypt /var/www/html \
    && chown -R nginx:nginx /var/www/html

# (Optional) Copy your custom Nginx configuration
# Make sure that it is configured to serve /.well-known/acme-challenge 
# from /var/www/html for HTTP-01 validations.
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Expose port 80 (HTTP)
EXPOSE 80

# Run Nginx in the foreground