# Please refer to the documentation:
# https://cloud.google.com/migrate/anthos/docs/dockerfile-reference

FROM anthos-migrate.gcr.io/v2k-run-embedded:v1.6.2 as migrate-for-anthos-runtime

# Image containing data captured from the source VM
FROM gcr.io/mikegcoleman-m4a-cicd/todo-non-runnable-base:3-6-2021--4-51-49 as source-content

# If you want to update parts of the image, add your commands here.
# For example:
# RUN apt-get update
# RUN apt-get install -y \
#		package1=version \
#		package2=version \
#		package3=version
# RUN yum update
# RUN wget http://github.com

COPY . /home/mikegcoleman/todo/


COPY --from=migrate-for-anthos-runtime / /

# Migrate for Anthos image includes entrypoint
ENTRYPOINT [ "/.v2k.go" ]
