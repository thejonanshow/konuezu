
size = 20
board = Array.new(size*size) { rand(2) }

loop do
  board.each.with_index { |cell, index| print "\n" if index % size == 0; print cell }

  board = board.map.with_index do |cell, index|
    sum = 0
    n=index-size
    s=index+size
    w=index-1
    e=index+1

    sum += board[n] || 0
    sum += board[s] || 0
    sum += board[w] || 0
    sum += board[e] || 0
    sum += board[n-1] || 0
    sum += board[n+1] || 0
    sum += board[s-1] || 0
    sum += board[s+1] || 0

    if board[index] == 0 # dead
      if sum == 3
        1
      else
        0
      end
    else # live
      if sum < 2 || sum > 3
        0
      else
        1
      end
    end
  end

  sleep 0.1
  puts "\n" * 100
end
