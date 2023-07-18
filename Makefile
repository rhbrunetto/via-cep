.PHONY: build test

activate_utils:
	dart pub global activate flutter_gen

dump_schema:
ifndef VERSION
	$(error "VERSION must be set")
endif
	flutter pub run drift_dev schema dump lib/db/db.dart db_schemas/schema_v$(VERSION).json

flutter_generate_test_schemas:
	flutter pub run drift_dev schema generate db_schemas test/generated/

flutter_test:
	flutter test

flutter_get:
	flutter pub get

flutter_build: flutter_get
	flutter pub run build_runner build --delete-conflicting-outputs

