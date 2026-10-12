15 PostgreSQL orders, copied into Iceberg with OLake.
Then queried in Spark SQL, with every business row checked against the source.

I put together a local tutorial for data engineers who want to see how OLake fits into a PostgreSQL-to-Iceberg pipeline.

OLake discovers the source schema and copies the selected table. MinIO stores the Parquet files and Iceberg metadata, while a REST catalog lets Spark find the table.

The walkthrough covers the connection check, schema discovery, and a full-refresh sync. It includes the Docker configuration and the SQL needed to verify the result: 15 matching rows, totaling 120,000 cents.

One detail worth checking before your first sync: discovery selected incremental mode with amount_cents as the cursor. I explicitly switched to full refresh for this snapshot demo. An order amount is not a reliable field for tracking changes.

Seeing the copied rows in Spark made the roles of storage, catalog, and ingestion much clearer. This example uses a complete snapshot; another sync is needed to reflect source changes.

If you want to try OLake locally, start with the README:
https://github.com/SohumDamani/olake-postgres-iceberg-demo

Share it with a teammate exploring Iceberg ingestion. I'd welcome notes on any setup step that needs a clearer explanation.
