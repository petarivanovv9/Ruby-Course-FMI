echo "Running skeptic..."
skeptic --lines-per-method 8 --line-length 80 --max-nesting-depth 1 --methods-per-class 10 --no-semicolons --no-trailing-whitespace --check-syntax --no-global-variables --english-words-for-names='xs ys' --naming-conventions 02_task.rb
printf "\n"

echo "Running spec..."
rspec 02_task_spec.rb --require ./02_task.rb --colour --format documentation