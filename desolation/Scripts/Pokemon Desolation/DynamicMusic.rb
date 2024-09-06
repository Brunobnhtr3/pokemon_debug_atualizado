$start=0
$ending=1000000
###calls a music much like the classic rpg maker function, using the library 
###defined here
def callMusic(song, volume, pitch, position =0)
  $start=position
  song="Audio/BGM/"+song
  #Audio.bgm_stop()
  Audio.bgm_play(song,volume,pitch,position)
  $thr=Thread.new{
  loop do
    if(Audio.bgm_pos>=$ending || Audio.bgm_pos<$start)
        Audio.bgm_play(song,volume,pitch,$start)
      sleep(1)
    end
  end}
end
###updates the two values after converting them in milliseconds. Honestly is just
###for conveniency's sake
def loopAroundMusic(start,ending)
  $start=start
  $ending= ending
end

def killMusic
    if (defined?$thr) && !($thr.nil?)
      Thread.kill($thr)
      $thr=nil
      Audio.bgm_stop()
    end
end