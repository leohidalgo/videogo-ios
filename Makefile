.PHONY: l10n lint xcodeproj

l10n:
	@swiftgen --config Packages/Core/Localizable/.swiftgen.yml

lint:
	@swiftlint lint --strict --progress

xcodeproj:
	xcodegen generate
