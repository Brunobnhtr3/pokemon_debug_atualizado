class IntroEventScene < EventScene
  def initialize(pics,splash,viewport=nil)
    super(nil)
    @pics=pics
    @splash=splash
    @pic=addImage(0,0,"")
    @pic.moveOpacity(0,0,0) # fade to opacity 0 in 0 frames after waiting 0 frames
    @pic2=addImage(0,0,"") # flashing "Press Enter" picture
    @pic2.moveOpacity(0,0,0)
    @pic3=addImage(0,0,"") # flashing "Press Enter" picture
    @pic3.moveOpacity(0,0,0)
    @pic4=addImage(0,0,"") # flashing "Press Enter" picture
    @pic4.moveOpacity(0,0,0)
    @pic5=addImage(0,0,"") # flashing "Press Enter" picture
    @pic5.moveOpacity(0,0,0)
    @index=0
    pbBGMPlay($cache.RXsystem.title_bgm)
    openPic(self,nil)
  end

  def openSplash(scene,args)
    onCTrigger.set(method(:closeSplash)) # call closeSplash when C key is pressed
    onUpdate.clear
    @pic.name="Graphics/Titles/sp1"
    @pic.moveOpacity(40,20,255)
    @pic2.name="Graphics/Titles/sp2"
    @pic2.moveOpacity(50,80,255)
    @pic3.name="Graphics/Titles/sp3"
    @pic3.moveOpacity(30,115,255)
    @pic4.name="Graphics/Titles/sp4"
    @pic4.moveOpacity(50,180,255)
    @pic5.name="Graphics/Titles/sp5"
    @pic5.moveOpacity(40,250,255)
    pictureWait
    onUpdate.set(method(:splashUpdate))  # call splashUpdate every frame
    onCTrigger.set(method(:closeSplash)) # call closeSplash when C key is pressed
  end

  def closeSplash(scene,args)
    onCTrigger.clear
    onUpdate.clear
    # Play random cry
    #cry=pbResolveAudioSE(pbCryFile(1+rand($cache.pkmn.length)))
    #pbSEPlay(cry,100,100) if cry
    # Fade out
    @pic.moveOpacity(1,0,0)
    @pic2.moveOpacity(1,0,0)
    @pic3.moveOpacity(1,0,0)
    @pic4.moveOpacity(1,0,0)
    @pic5.moveOpacity(20,0,0)
    pbBGMStop(1.0)
    scene.dispose # Close the scene
    sscene=PokemonLoadScene.new
    sscreen=PokemonLoad.new(sscene)
    sscreen.pbStartLoadScreen
  end
end

class Scene_Intro
  def initialize(pics, splash = nil)
    @pics=pics
    @splash=splash
  end

  def main
    Graphics.transition(0)
    $DEBUG = false
    @eventscene=IntroEventScene.new(@pics,@splash)
    @eventscene.main
    Graphics.freeze
  end
end
