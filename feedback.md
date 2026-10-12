# OLake setup feedback

- **Discovery's default mode needs a clearer explanation.** For our orders table, it selected incremental mode and chose amount_cents as the cursor. We wanted a full snapshot and changed it to full_refresh. An amount can decrease or stay unchanged while other fields change. Explain how the cursor is chosen, and show a minimal full-refresh streams.json example alongside discovery.

- **The local MinIO configuration looks like an AWS setup.** Fields such as aws_access_key, aws_secret_key, and aws_region caused confusion about whether a cloud account was required. A short mapping of these fields to MinIO credentials, plus a clear explanation of the fixed signing region, would help readers stay focused on the local workflow.

- **Catalog persistence deserves an explicit setup checkpoint.** The source orders database and the catalog backing database have different roles. Explain that object files and catalog registrations must both persist, and show when to create the catalog database before starting the REST service.

- **The first sync produces distracting messages.** It logged a missing destination table during the full-refresh clearing step and created a separate test_olake table for its destination check. Both accompanied a successful sync. Label expected first-run messages clearly and explain the purpose and lifecycle of the test table.

- **The recommended REST image exposes credentials in startup logs.** Its catalog properties included the JDBC password. This is feedback on the local REST stack, rather than the PostgreSQL connector. Use a redacted example or warn readers before suggesting they capture and share those logs.
