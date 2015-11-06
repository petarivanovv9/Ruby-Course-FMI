echo "Running skeptic..."
skeptic --lines-per-method 8 --line-length 80 --max-nesting-depth 2 --methods-per-class 16 --no-semicolons --no-trailing-whitespace --check-syntax --no-global-variables --english-words-for-names='WarDeck BeloteDeck SixtySixDeck belote tierce quarte carre' --naming-conventions --max-method-arity 4 --spaces-around-operators 04_task.rb
printf "\n"

echo "Running spec..."
rspec sample_spec.rb --require ./04_task.rb --colour --format documentation
