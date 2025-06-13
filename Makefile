.PHONY: l10n lint snapshot_tests xcodeproj

l10n:
	@swiftgen --config Packages/Core/Localizable/.swiftgen.yml

lint:
	@swiftlint lint --strict --progress

snapshot_tests:
	@xcodebuild -scheme MediaFeatureSnapshotTests -destination "platform=iOS Simulator,name=iPhone 16 Pro,OS=18.5" test | xcbeautify

tests:
	@xcodebuild -scheme MediaFeatureTests -destination "platform=iOS Simulator,name=iPhone 16 Pro,OS=18.5" test | xcbeautify

xcodeproj:
	@xcodegen generate
