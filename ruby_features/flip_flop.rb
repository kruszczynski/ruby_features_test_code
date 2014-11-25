(1..15).each do |x|
  if (x == 5) .. (x == 10)
    puts "#{x}: true"
  else
    puts "#{x}: false"
  end
end
# 1: false
# 2: false
# 3: false
# 4: false
# 5: true
# 6: true
# 7: true
# 8: true
# 9: true
# 10: true
# 11: false
# 12: false
# 13: false
# 14: false
# 15: false
