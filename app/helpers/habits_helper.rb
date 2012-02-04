module HabitsHelper
  
  def score_color(habit)
    s = habit.score
    case
      when s<-5 then return 'bad'
      when s>=-5 && s<0 then return 'iffy' 
      when s>=0 && s<5 then return 'ok' 
      when s>=5 && s<15 then return 'good' 
      when s>=15 then return 'done' 
     end
  end
  
  def vote_link(habit, direction=nil)
    if direction=='up'
      return unless habit.up
      text,dir,style = "+","up","up"
    elsif direction=='down'
      return unless habit.down
      text,dir,style = "-","down","down"
    elsif habit.done
      text,dir,style = "[X]","down","check"
    else
      text,dir,style = "[ ]","up","check" 
    end
    return link_to(text, { :action => "vote", :id => habit.id, :vote => dir }, :class=>style, :remote=>true)
  end
  
  def user_gold
    current_user.money.to_i
  end
  
  def user_silver
    number_with_precision(current_user.money, :precision=>1).split('.')[1]
  end
  
end
