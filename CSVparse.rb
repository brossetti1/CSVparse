require 'CSV'

vol = 423522
cnt = 9298

dist_cost = []

parse = CSV.read("testDB.csv")
parse = parse.map do |index| 
  [index[0].to_i, index[1], index[2].to_f, index[3].to_f, 
   index[4].to_f, index[5].to_f]
end

parse.each do |index|
  calc_vol = (index[2] * vol) * index[4]
  calc_cnt = (index[3] * cnt).to_i * index[5]
  dist_cost << calc_vol.round(2)
  dist_cost << calc_cnt.round(2)
  p "calc vol #{index[1]}: #{calc_vol} index: #{index[4]} voldist: #{index[2] * vol}"
  p "calc cnt #{index[1]}: #{calc_cnt} index: #{index[5]} cntdist: #{(index[3] * cnt).to_i}"
end

sum_total = dist_cost.inject {|sum, cost| sum += cost}
sum_total = sum_total.round(2)
