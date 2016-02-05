echo "Running skeptic..."
skeptic --lines-per-method 6 --line-length 80 --max-nesting-depth 2 --methods-per-class 8 --no-semicolons --no-trailing-whitespace --check-syntax --no-global-variables --english-words-for-names='' --naming-conventions --max-method-arity 4 --spaces-around-operators 08_task.rb
printf "\n"

echo "Running spec..."
rspec sample_spec.rb --require ./08_task.rb --colour --format documentation
