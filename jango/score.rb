CHAIN = 20
COMBO = 20

(1 .. 5).each { |combo|
  tr = (2 .. 5).map { |piece|
    (CHAIN + COMBO * (combo - 1)) * (piece - 1)
  }.join('|')
  puts("|#{combo}|#{tr}|")
}
