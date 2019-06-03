#!/bin/bash
mkdir -p .build/x86_64-apple-macosx/debug/MTGJSONDecodablePackageTests.xctest/Contents
cp -r Tests/MTGJSONDecodableTests/Resources .build/x86_64-apple-macosx/debug/MTGJSONDecodablePackageTests.xctest/Contents
swift test
