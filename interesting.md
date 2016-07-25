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

## Функционални закачки
Стандартните функционални неща:
```
numbers = [-9, -4, -1, 0, 1, 4, 9]

positive = numbers.select { |n| n >= 0 }
# => [0, 1, 4, 9]
even = numbers.reject { |n| n.odd? }
# => [-4, 0, 4]
squares = numbers.map { |n| n**2 }
# => [81, 16, 1, 0, 1, 16, 81]
roots = numbers.select { |n| n > 0 }.map { |n| n**0.5 }
# => [1.0, 2.0, 3.0]
```

## Стойности в Ruby, които се оценяват като лъжа:
```
nil
false
```

## Immutability vs Mutability
* Immutable (непроменяем) обект е такъв обект, чието състояние не може да бъде променено.
* Mutable (променяем) обект е такъв обект, чието състояние може да бъде променено.
```
immutable objects - 42, :answer
mutable objects - 'wartburg', [2, 4, 6], {name: 'Spaghetti', origin: 'Italy'}
```

## Мързеливи енумератори
* Методът Enumerable#lazy връща "мързелив" енумератор
* Има и Enumerator#lazy
* Дадената стойност се оценява само когато потрябва

## #const_get
Какъв ще е резултатът от кода по-долу – грешка или стойност? Ако е стойност, каква?
```
class Foo; end
class Bar; end

Foo.const_get(:Bar).name # => ?
```
Резултатът ще е "Bar". const_get работи на принципа на нормалното търсене на константи. Ако константа не се намери в текущия namespace, се продължава търсене нагоре, докато евентуално не се стигне до root namespace-а.

## Интроспекция
```
String.instance_methods == "abc".methods # => true
String.methods          == "abc".methods # => false

"abc".length     # => 3
String.length    # => error: NoMethodError

String.ancestors # => [String, Comparable, Object, Kernel, BasicObject]
"abc".ancestors  # => error: NoMethodError
```

```
class A; end
class B < A; end
class C < B; end

C.superclass                       # => B
C.superclass.superclass            # => A
C.superclass.superclass.superclass # => Object
```
* Инстанциите пазят полета, пък класовете - методи
* Mодулите също пазят методи
* Class е наследник на Module
* Class.superclass == Module, oще известно като Class < Module
* В Ruby, данните се пазят в обекти, а кодът - в модули

## Object#instance_eval
* Всеки Ruby израз има някакъв неявен self
* Този self се ползва за полета (@foo) и търсене на методи (bar()).
* Може да го наричаме "текущ обект"
* instance_eval променя self в рамките на един блок

## Module#class_eval
* променя и self, и текущия клас
