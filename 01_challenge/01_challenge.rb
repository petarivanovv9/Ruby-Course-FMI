def complement(f)
  ->(*args) { not f.call(*args) }
end

def compose(f, g)
  ->(*args) { f.call(g.call(*args)) }
end
