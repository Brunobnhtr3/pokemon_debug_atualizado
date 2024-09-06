
def addPassword(entrytext)
    #add stuff to password array if cass makes a thing for that
    entrytext.downcase!
  
    # Check if string is in hashes
    if PASSWORD_HASH[entrytext]
      $game_switches[PASSWORD_HASH[entrytext]] = !$game_switches[PASSWORD_HASH[entrytext]]
    end
  
    if BULK_PASSWORDS[entrytext]
  
      # Activate ones that are not on yet
      if BULK_PASSWORDS[entrytext].any? {|string| $game_switches[PASSWORD_HASH[string]] } && !BULK_PASSWORDS[entrytext].all? {|string| $game_switches[PASSWORD_HASH[string]] }
        Kernel.pbMessage("Some passwords included in this paswordpack are already applied, all will be applied now.")
        BULK_PASSWORDS[entrytext].each {|password_string|
          password = PASSWORD_HASH[password_string]
          $game_switches[password] = true
        }
  
      # Disable if all of them are on
      elsif BULK_PASSWORDS[entrytext].all? {|string| $game_switches[PASSWORD_HASH[string]] }
        if Kernel.pbConfirmMessage("All passwords included in this passwordpack are already turned on. Do you want to turn all of them off?")
          BULK_PASSWORDS[entrytext].each {|password_string|
            password = PASSWORD_HASH[password_string]
            $game_switches[password] = false
          }
        else
          $game_switches[907] = true
          return
        end
  
      # Just turn them all on
      else
        BULK_PASSWORDS[entrytext].each {|password_string|
          password = PASSWORD_HASH[password_string]
          $game_switches[password] = true
        }
      end
    end
  
    #check for level passwords to go to adjustment section in event
    if ((entrytext == "leveloffset") || (entrytext == "setlevel") || (entrytext == "flatlevel" ))
        $game_variables[266] = 1
    end
    if ((entrytext == "percentlevel")||(entrytext == "levelpercent"))
        $game_variables[266] = 2
    end
    if PASSWORD_HASH[entrytext].nil? && BULK_PASSWORDS[entrytext].nil? && !["leveloffset", "setlevel", "flatlevel", "percentlevel", "levelpercent"].include?(entrytext)
      $game_switches[907] = true
    end
=begin
    case entrytext
      # shenanigans
      when "randomizer", "random", "randomized", "randomiser", "randomised"
        pbFadeOutIn(99999){
          RandomizerScene.new(RandomizerSettings.new)
        }
      else # no password given
        if PASSWORD_HASH[entrytext].nil? && BULK_PASSWORDS[entrytext].nil? && !["leveloffset", "setlevel", "flatlevel", "percentlevel", "levelpercent"].include?(entrytext)
          $game_switches[907] = true
        end
    end
=end
  
    # flip all the field app switches
    if $game_switches[2055]
      # $game_switches[599] = true
      # $game_switches[600] = true
      # $game_switches[601] = true
      # $game_switches[602] = true
      # $game_switches[603] = true
      # $game_switches[604] = true
      # $game_switches[605] = true
      # $game_switches[606] = true
      # $game_switches[607] = true
      # $game_switches[608] = true
      # $game_switches[609] = true
      # $game_switches[610] = true
      # $game_switches[611] = true
      # $game_switches[612] = true
      # $game_switches[613] = true
      # $game_switches[614] = true
      # $game_switches[615] = true
      # $game_switches[616] = true
      # $game_switches[617] = true
      # $game_switches[618] = true
      # $game_switches[619] = true
      # $game_switches[620] = true
      # $game_switches[621] = true
      # $game_switches[622] = true
      # $game_switches[623] = true
      # $game_switches[624] = true
      # $game_switches[625] = true
      # $game_switches[626] = true
      # $game_switches[627] = true
      # $game_switches[628] = true
      # $game_switches[629] = true
      # $game_switches[630] = true
      # $game_switches[631] = true
      # $game_switches[632] = true
      # $game_switches[633] = true
      # $game_switches[634] = true
      # $game_switches[635] = true
      # $game_switches[636] = true
    end
  end
  
  def checkPasswordActivation(entrytext)
    if PASSWORD_HASH[entrytext]
      return $game_switches[PASSWORD_HASH[entrytext]]
    end
    if BULK_PASSWORDS[entrytext]
      return $game_switches[PASSWORD_HASH[BULK_PASSWORDS[entrytext][0]]]
    end
  end
  
  #########################################################################
  # Passwords menu                                                        #
  #########################################################################
  
  def pbPasswordsMenu(maxOperations=nil)
    # Passing nil is the same as passsing infinite as maxOperations
    operationCost=1
    operationsLeft=maxOperations
    passwords=pbGetKnownOrActivePasswords()
    continue=true
    while continue
      continue,password=pbSelectPasswordToBeToggled(passwords, operationsLeft)
      next if !password
      next if !continue
      doExecute=true
      if maxOperations
        if operationsLeft<operationCost
          Kernel.pbMessage(_INTL('No Data Chip available to boot up the system.'))
          doExecute=false
        else
          doExecute=Kernel.pbConfirmMessage('This will consume a Data Chip. Do you want to continue?')
        end
      end
      password=password.downcase
      ids=pbGetPasswordIds(password)
      if !ids
        Kernel.pbMessage('That is not a password.')
        next
      end
      success=doExecute ? pbTogglePassword(password) : false
      alreadyKnown=true
      for id,pw in ids
        alreadyKnown=alreadyKnown && passwords[id] ? true : false
        # Toggle the password
        active=$game_switches[id] ? true : false
        passwords[id]={
          'password': pw,
          'active': active
        }
      end
      # Update the saved list
      # pbSaveKnownPasswordsToFile(passwords) if !alreadyKnown
      pbUpdateKnownPasswords(passwords) if !alreadyKnown
      # Pay the price
      operationsLeft-=operationCost if success && maxOperations
    end
    return 0 if !maxOperations
    return maxOperations-operationsLeft
  end
  
  def pbGetPasswordIds(password)
    retval={}
    id=PASSWORD_HASH[password]
    if id
      retval[id]=password
      return retval
    end
    passwordBulk=BULK_PASSWORDS[password]
    return nil if !passwordBulk
    retval={}
    for pw in passwordBulk
      id=PASSWORD_HASH[pw]
      retval[id]=pw if id
    end
    return nil if retval.empty?()
    return retval
  end
  
  def pbSelectPasswordToBeToggled(passwords, operationsLeft)
    pwList,pwListIds=pbPasswordsToList(passwords)
    i=Kernel.pbMessage(
      operationsLeft ? _INTL('Known passwords\nAvailable data chips: {1}', operationsLeft) : _INTL('Known passwords'),
      pwList,
      1
    )
    return false,nil if i<1
    if i>1
      # Already known
      choice=pwList[i]
      id=pwListIds[choice]
      password=passwords[id][:password]
      return true,password
    end
    # New password
    password=Kernel.pbMessageFreeText(_INTL('Which password would you like to add?'),'',false,12,Graphics.width)
    return true,password
  end
  
  def pbPasswordsToList(passwords)
    pws=[]
    marks={}
    for id,val in passwords
      pw=val[:password]
      pws.push(pw)
      mark=val[:active] ? '> ' : '    '
      marks[pw]={
        'mark': mark,
        'id': id
      }
    end
    retval=[
      '[Exit]',
      '[Add password]'
    ]
    markedIds={}
    orderedPws=pws.sort { |a,b| a <=> b }
    for pw in orderedPws
      data=marks[pw]
      line="#{data[:mark]}#{pw}"
      retval.push(line)
      markedIds[line]=data[:id]
    end
    return retval,markedIds
  end
  
  def pbGetKnownOrActivePasswords
    # knownPasswords=pbLoadKnownPasswordsFromFile()
    knownPasswords=pbLoadKnownPasswords()
    retval={}
    for pw,id in PASSWORD_HASH
      next if retval[id] # Don't repeat the check
      active=$game_switches[id] ? true : false
      known=knownPasswords[id] ? true : false
      next if !active && !known # Undiscovered password?
      retval[id]={
        'password': knownPasswords[id] || pw,
        'active': active
      }
    end
    return retval
  end

  
  def pbLoadKnownPasswords
    retval={}
    return retval if !$Unidata[:knownPasswords]
    for pw in $Unidata[:knownPasswords]
      id=PASSWORD_HASH[pw]
      retval[id]=pw if id
    end
    return retval
  end
  def pbUpdateKnownPasswords(passwords)
    pws=[]
    for _,val in passwords
      pws.push(val[:password])
    end
    $Unidata[:knownPasswords]=pws
  end
  
  def pbTogglePassword(password, isGameStart=false)
    password_string=password.downcase()
    if !isGameStart && ['fullivs'].include?(password_string) && checkPasswordActivation(password_string)
      Kernel.pbMessage(_INTL('This password cannot be disabled anymore.'))
      return false
    end
    if !isGameStart && ['randomizer', 'eeveeplease', 'eevee', 'bestgamemode', 'random', 'randomized', 'randomiser', 'randomised'].include?(password_string)
      Kernel.pbMessage(_INTL('This password cannot be entered anymore.'))
      return false
    end
    $game_switches[907] = false
    addPassword(password_string) # Toggles the password
    if $game_switches[907]
      # It should never actually get to this section anymore...
      Kernel.pbMessage('That is not a password.')
      return false
    end
    if !checkPasswordActivation(password_string)
      Kernel.pbMessage('Password has been disabled.')
      return true
    end
    if ['leveloffset', 'setlevel', 'flatlevel'].include?(password_string)
      params=ChooseNumberParams.new
      params.setRange(-99,99)
      params.setInitialValue(0)
      params.setNegativesAllowed(true)
      $game_variables[:Level_Offset_Value]=Kernel.pbMessageChooseNumber('Select the offset amount.',params)
    elsif ['percentlevel', 'levelpercent'].include?(password_string)
      params=ChooseNumberParams.new
      params.setRange(0,999)
      params.setInitialValue(100)
      $game_variables[:Level_Offset_Percent]=Kernel.pbMessageChooseNumber('Select the percentage adjustment.',params)
    end
    Kernel.pbMessage('Password has been enabled.')
    #pbMonoRandEvents if GAMETITLE == 'Pokemon Reborn'
    return true
  end