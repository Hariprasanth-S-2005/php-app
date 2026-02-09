# Base image
FROM public.ecr.aws/docker/library/php:8.2-fpm

# Install dependencies
RUN apt-get update && apt-get install -y nginx \
    && docker-php-ext-install pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

# Copy application
COPY index.php /var/www/html/

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port
EXPOSE 80

# Start PHP-FPM and Nginx
CMD service nginx start && php-fpm
