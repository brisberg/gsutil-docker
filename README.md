# gsutil-docker
Minimal docker image to set up Google Storage Utility (gsutil)

Built image is only 212 MB!

To authenticate `gsutil` with Google Storage using a Service Account:

1. Pull this image with `docker pull brisberg/gsutil-docker`, or clone this repo
2. Create a service account for your project, instructions here, and download the `<credentials_filename>.json` file.
3. Place the `.json` file in the `./config` directory in this project folder
4. Generate your `.boto` config file using the following command:
   - ```docker run --rm -it -v /path/to/local/repo/config:/etc/gsutil/auth brisberg/gsutil-docker config -e -o /etc/gsutil/auth/.boto```
5. Follow the commands in your console, using `/etc/gsutil/auth/<credential_filename>.json` for the key file.
6. Your config directory should now have a `.boto` file in it.
7. Test your authentication by running the container again with a `gsutil` command, example:
   - ```docker run --rm -v /path/to/local/repo/config:/etc/gsutil/auth brisberg/gsutil-docker ls gs://<bucketname>```

*Note*: This proceedure uses the older authentication method for the standlone version of `gsutil`.
It will not work for installations from the Google Cloud toolkit. Use `gcloud auth login` instead.
