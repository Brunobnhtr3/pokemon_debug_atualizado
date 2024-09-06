class PokeBattle_Battler	
	alias pbUseMoveOld pbUseMove
	
	def pbUseMove(choice, flags={danced: false, totaldamage: 0, specialusage: false})
    
		if @battle.recorded == true
			$game_variables[:BattleDataArray].last().pokemonTrackMove(choice, pbFindUser2(choice,choice[2]),@battle.battlers)
		end
    pbUseMoveOld(choice,flags)
	end
  
  def pbFindUser2(_choice,_move)
    return self
  end
end