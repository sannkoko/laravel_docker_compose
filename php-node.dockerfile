# Use the existing PHP + Composer image as the base
FROM image.test:latest

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest # Optional: Update npm to the latest version

# Set the working directory inside the container
WORKDIR /var/www/html

# Default command
#CMD ["/bin/bash"]
#CMD ["php-fpm"]
#CMD ["npm", "run", "watch"]
CMD ["tail" "-f" "/dev/null"]