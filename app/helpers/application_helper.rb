module ApplicationHelper
  def ret_category(num)
    if num == 1
      "Achieveに関して"
    elsif num == 2
      "テキストに関して"
    elsif num == 3
      "説明会に関して"
    elsif num == 4
      "その他"
    end
  end
end
