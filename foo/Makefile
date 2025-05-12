.PHONY: seed run test docs serve_docs clean all debug safe-all sample-query view-query

BUCKET = foo-athena-query-result

# Load seed data to Athena
seed:
	uv run dbt seed

# Run all models
run:
	uv run dbt run

# Test models
test:
	uv run dbt test

# Generate documentation
docs:
	uv run dbt docs generate

# Serve documentation locally
serve_docs: docs
	uv run dbt docs serve

# Clean the target directory
clean:
	uv run dbt clean

# Full development cycle: seed data, run models, test, and generate docs
all: clean seed run test docs

# A safer version that continues even if tests fail
safe-all: clean seed run
	-uv run dbt test || true
	uv run dbt docs generate

# Show debug information 
debug:
	uv run dbt debug
	aws s3 ls --recursive s3://$(BUCKET)
	@echo "Current database structure:"
	-aws athena start-query-execution --query-string "SHOW TABLES IN dbt" --result-configuration "OutputLocation=s3://$(BUCKET)/query-results/" --query-execution-context "Database=awsdatacatalog" --region eu-west-2

# Run a sample query in Athena
sample-query:
	@echo "Running sample query in Athena..."
	aws athena start-query-execution \
		--query-string "SELECT * FROM dbt.customers LIMIT 10" \
		--result-configuration "OutputLocation=s3://$(BUCKET)/query-results/" \
		--query-execution-context "Database=awsdatacatalog" \
		--region eu-west-2

# View query results for a specific execution ID
view-query:
	@if [ -z "$(QUERY_ID)" ]; then \
		echo "Error: Please provide a query ID using QUERY_ID=<id>"; \
		echo "Example: make view-query QUERY_ID=e1f16c27-7895-43be-a898-7b2ec5963f64"; \
		exit 1; \
	fi
	@echo "Checking status of query $(QUERY_ID)..."
	aws athena get-query-execution --query-execution-id $(QUERY_ID) --region eu-west-2
	@echo "\nFetching query results..."
	aws athena get-query-results --query-execution-id $(QUERY_ID) --region eu-west-2

create-bucket:
	aws s3 mb s3://$(BUCKET)

list:
	aws s3 ls --recursive s3://$(BUCKET)
