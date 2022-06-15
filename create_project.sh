#!/bin/bash    

read -p "Enter project name: default [test_app] " name
name=${name:-test_app}
echo $name
echo
read -p "Enter project id: default [ru.example] " org
org=${org:-ru.example}
echo $org
echo
 
flutter create --org $org $name
cd $name 

dart pub add dart_code_metric && dart pub add very_good_analysis 

echo "include: package:very_good_analysis/analysis_options.yaml

linter:
  rules:
    public_member_api_docs: false
    sort_pub_dependencies: false


analyzer:
  # errors:
  #   argument_type_not_assignable: ignore
  #   invalid_assignment: ignore


  plugins:
    - dart_code_metrics
  strong-mode:
    implicit-dynamic: true
    implicit-casts: true
  exclude:
    # Generated code
    - "**.g.dart"
    - "**.freezed.dart"
    - "lib/**.graphql.dart"
    - "lib/**.gen.dart"
    - "lib/generated_plugin_registrant.dart"
    - "lib/pigeon.dart"
    # Firebase
    - "lib/src/common/constant/firebase_options.dart"
    # Localization
    - "lib/src/common/localization/intl/**"
    - "lib/src/common/localization/l10n.dart"
    # Tests
    - "test/**.mocks.dart"
    - ".test_coverage.dart"
    # Web
    - "web/**"
    # Build
    - "build/**"
    # Assets
    - "assets/**"

dart_code_metrics:
  anti-patterns:
    - long-method
    - long-parameter-list
  metrics:
    cyclomatic-complexity: 20
    maximum-nesting-level: 5
    number-of-parameters: 4
    source-lines-of-code: 50
  metrics-exclude:
    - test/**
  rules-exclude:
    - lib/firebase_options.dart
  rules:
    - avoid-collection-methods-with-unrelated-types
    - avoid-unused-parameters
    - member-ordering:
        alphabetize: false
        order:
          - constructors
          - public-fields
          - private-fields
    - newline-before-return
    - no-boolean-literal-compare
    - no-empty-block
    - no-equal-then-else
    - no-object-declaration
    - prefer-conditional-expressions
    - prefer-first
    - prefer-last
    - prefer-trailing-comma
    - avoid-nested-conditional-expressions:
        acceptable-level: 3
    - avoid-global-state
    - avoid-missing-enum-constant-in-map
    - avoid-unnecessary-type-assertions
    - avoid-unnecessary-type-casts
    - avoid-unrelated-type-assertions
    - avoid-border-all
    - avoid-throw-in-catch-block
    - binary-expression-operand-order
    - double-literal-format
    - prefer-const-border-radius
    - prefer-async-await
    - prefer-immediate-return

    # name class and method
    - prefer-correct-identifier-length:
        exceptions: ["i"]
        min-identifier-length: 2
        max-identifier-length: 30

    - prefer-correct-type-name
    # Flutter specific
    - prefer-single-widget-per-file:
        ignore-private-widgets: true
    - prefer-extracting-callbacks
    - prefer-const-border-radius
    - avoid-wrapping-in-padding
    - avoid-unnecessary-setstate
    # - avoid-returning-widgets
    - always-remove-listener
    - prefer-match-file-name"> analysis_options.yaml 


flutter clean
flutter pub get
flutter pub upgrade
flutter pub outdated
dart fix --apply
dart format . -l 80 

echo
echo "     All done!"
echo
echo "     $name << name project"
echo "     $org.$name << id package"
echo
echo "     In order to run your application, type:"
echo
echo "     $ cd $name"
echo "     $ flutter run"
echo


