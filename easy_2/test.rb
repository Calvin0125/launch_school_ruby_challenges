hash = {
  4 => 'four',
  3 => 'three',
  2 => 'two',
  1 => 'one'
}

p hash.values_at(*(1..3).to_a.reverse)