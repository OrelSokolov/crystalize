# Todo

## Checks
- File should define only 1 class
- Non basic classes are not passed into hash

## Transforms
- Transform all lambda calls from `[]` to `.call`
- Automatic definition for `Anything` generic type based on class list
- Ruby ternary to if
- lonely operator `&.method` to `.try(&method)`
- `class << self` to each `self.*` method
- All `method(key: value)` to `method({key: value})`
- Transform Hashes to Ruby compatible syntax
