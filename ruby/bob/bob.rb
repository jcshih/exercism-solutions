class Bob
  def hey(remark)
    remark = remark.strip.split("\n").join(' ')
    if remark.match(/^\s*$/)
      'Fine. Be that way!'
    elsif remark.match(/^[A-Z,\s]+[!?]?$|^[A-Z\d,\s!@#$%^&*()]+!$/)
      'Whoa, chill out!'
    elsif remark[-1] == '?'
      'Sure.'
    else
      'Whatever.'
    end
  end
end
