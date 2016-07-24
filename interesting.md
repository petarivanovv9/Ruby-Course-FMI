# Some interesting things in ruby

## Равенство
```
one == two      # сравнява по стойност
one === two     # специален оператор, който се използва в case
one.eql? two    # сравнява по стойност и тип
one.equal? two  # връща true, само ако one и two са един и същ обект
```

```
42.equal? 42              # true
:answer.equal? :answer    # true
'answer'.equal? 'answer'  # false
'answer' == 'answer'      # true
```

## Стойности в Ruby, които се оценяват като лъжа:
```
nil
false
```

## Immutability vs Mutability
Immutable (непроменяем) обект е такъв обект, чието състояние не може да бъде променено.

Mutable (променяем) обект е такъв обект, чието състояние може да бъде променено.
```
immutable objects - 42, :answer
mutable objects - 'wartburg', [2, 4, 6], {name: 'Spaghetti', origin: 'Italy'}
```
