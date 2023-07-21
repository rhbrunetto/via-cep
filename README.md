# ava

## Build

Some features rely on code generation, that is not versioned.

You can generate these files (build the app) by running `make flutter_build`

## Test migrations

1. Generate schemas running `make flutter_generate_test_schema`
2. Run migration test `make flutter_test`

To dump a new schema run `export <VERSION>; make dump_schema` where <VERSION> is the latest database version.
