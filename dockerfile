FROM httpd:latest
RUN mkdir /home/ujjawal 
RUN htpasswd -c -b /home/ujjawal/passwd ujjawal ujjawalmandhani
RUN chown www-data /home/ujjawal/passwd
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
CMD ["sh", "-c", "httpd && tail -f /dev/null"]