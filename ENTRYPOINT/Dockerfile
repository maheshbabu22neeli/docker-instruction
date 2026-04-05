FROM nginx

# CMD ["ping", "google.com"]
# this CMD can be override by passing the RUN command as `docker run <image_name> ping facebook.com`.

# ENTRYPOINT ["ping", "google.com"]
# this can't be overfide and if we try to override it adds as an argument to the entrypoint.
# For example, `docker run <image_name> ping google.com`
# It will take the ENTRY POINT coomand as `ping google.com ping facebook.com`.

CMD ["google.com"]

ENTRYPOINT ["ping"]
# This will work as the entry point is ping and the CMD is google.com, so it will run `ping google.com`.
# docker run <image_name> facebook.com
# This will run `ping facebook.com` as the entry point is ping and the CMD is facebook.com.
