class Float
  def round_to_places(places)
    sprintf("%#{self.to_s.length}.#{places}f", self).to_f
  end
end