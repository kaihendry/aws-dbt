BUCKET = foo-athena-query-result

create-bucket:
	aws s3 mb s3://$(BUCKET)

run:
	uv run dbt run --profiles-dir .

list:
	aws s3 ls --recursive s3://$(BUCKET)