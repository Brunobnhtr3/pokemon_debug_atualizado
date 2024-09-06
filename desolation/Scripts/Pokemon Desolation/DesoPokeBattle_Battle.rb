class PokeBattle_Battle
  def canChangeFE?(newfield=[])
    newfield = [newfield] if newfield && !newfield.is_a?(Array)
    return !([:UNDERWATER,:NEWWORLD,:DARKNESS1,:DARKNESS2,:DARKNESS3]+newfield).include?(@field.effect)
  end
end