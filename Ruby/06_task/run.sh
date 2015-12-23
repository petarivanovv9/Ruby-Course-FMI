echo "Running skeptic..."
skeptic --lines-per-method 10 --line-length 85 --max-nesting-depth 2 --methods-per-class 10 --no-semicolons --no-trailing-whitespace --check-syntax --no-global-variables --naming-conventions --max-method-arity 4 --spaces-around-operators 06_task.rb
printf "\n"

echo "Running spec..."
rspec extended_spec.rb --require ./06_task.rb --colour --format documentation
