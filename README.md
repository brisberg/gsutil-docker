# gsutil-docker
Minimal docker image to set up Google Storage Utility (gsutil)

Built image is only 212 MB!

To authenticate `gsutil` with Google Storage using a Service Account:

1. Create a service account for your project, instructions here, and download the `credentials.json` file.
2. Place the `.json` file in the `./config` directory in this project folder
3. Generate your `.boto` config file using the following command:
   - docker run -rm -it -v /path/to/local/repo/config:/etc/gsutil/auth gsutil config -e -o /etc/gsutil/auth/.boto
4. Follow the commands in your console, using `/etc/gsutil/auth/<credential_filename>.json` for the key file.
5. Your config file should now have a `.boto` file in it.
6. Test your authentication by running the container again with a `gsutil` command, example:
   - docker run -rm -v /path/to/local/repo/config:/etc/gsutil/auth gsutil ls gs://<bucketname>

*Note*: This proceedure uses the older authentication method for the standlone version of `gsutil`.
It will not work for installations from the Google Cloud toolkit. Use `gcloud auth login` instead.
