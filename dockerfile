FROM httpd:latest
RUN apt-get update && apt install nano python3 -y
RUN mkdir /home/ujjawal 
RUN htpasswd -c -b /home/ujjawal/passwd ujjawal ujjawalmandhani
RUN chown www-data /home/ujjawal/passwd
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY .htaccess /usr/local/apache2/htdocs/.htaccess
COPY ./infinite/ /home/infinite
CMD ["sh", "-c", "httpd && python3 /home/infinite/infinite.py"]