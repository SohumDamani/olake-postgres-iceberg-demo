I got PostgreSQL data into Iceberg with OLake, then queried it in Spark.
Watching an updated order and a new one appear after the next sync was pretty satisfying!

If you're new to OLake, it's an open-source ingestion tool that moves source data into Apache Iceberg tables. You configure the source and destination, choose the tables and sync mode, and OLake handles the data transfer.

I built a tutorial around a small orders table to make that workflow easy to follow. Everything runs locally in Docker, so you can try it without setting up a cloud account.

Here's the flow:

PostgreSQL -> OLake -> Iceberg files in MinIO

OLake registers the table through a REST catalog. Spark uses that catalog to find and query the copied data. Iceberg provides the table format; MinIO stores the files.

The initial sync copied 15 orders totaling 120,000 cents. I checked every sorted business row against PostgreSQL, along with the count and total.

Then I updated one order and inserted another. After a second sync, Spark showed both changes: 16 orders totaling 136,500 cents.

This tutorial uses full refresh, so source changes appear after another sync runs. The README walks through that behavior and includes the configuration, Spark queries, and setup gotchas.

One detail to check: discovery selected incremental mode with amount_cents as its cursor. I changed it to full refresh for this example. An order amount isn't a reliable way to track changes.

If you've been curious about OLake or want a concrete introduction to Iceberg ingestion, try the walkthrough:
https://github.com/SohumDamani/olake-postgres-iceberg-demo

Share it with a teammate exploring Iceberg. I'd love to hear which parts helped and where the instructions could be clearer.
