.PHONY: lint xcodeproj

lint:
	@swiftlint lint --strict --progress

xcodeproj:
	xcodegen generate
