# OLake setup feedback

I used OLake's PostgreSQL CLI with a REST catalog and local MinIO storage. These are the parts of the setup I would make clearer for someone trying it for the first time:

- Discovery selected `incremental` mode with `amount_cents` as the cursor. I wanted a full snapshot, so I changed the mode to `full_refresh` and removed the cursor. An amount can stay unchanged while other order fields change. I would add a short explanation of how the default mode and cursor are selected, plus an example showing the edits needed for a full refresh.

- The `aws_access_key`, `aws_secret_key`, and `aws_region` fields initially made me think the MinIO setup needed an AWS account. A sentence explaining that these are S3-client settings, with a mapping to the local MinIO credentials, would have saved that confusion.

- The first sync reported that the destination table did not exist before creating it successfully. A separate `test_olake` table also appeared. A note explaining these first-run behaviors, and a clear completion summary with the destination table name and record count, would make the output easier to follow.

- The REST catalog image used in the local setup printed its JDBC password in startup logs. This comes from the catalog service. I would recommend a configuration or image that masks the password, and mention the issue wherever the docs suggest sharing troubleshooting logs.
