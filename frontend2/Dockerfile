# Use the official Nginx image as a base.
# The 'alpine' version is very small and efficient.
FROM nginx:alpine

# Copy your 'index.html' file into the default Nginx web directory.
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80, which is the default port for Nginx.
EXPOSE 90

# Command to run Nginx in the foreground when the container starts.
CMD ["nginx", "-g", "daemon off;"]

