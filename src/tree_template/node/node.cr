abstract class TreeTemplate::Node
  abstract def render(formatter : TreeTemplate::Formatter, page : TreeTemplate? = nil)

  # Just a helper method for making hash from Named Tuple.
  def make_hash(**tuple) : Hash(AllowedKey, AllowedValue)
    h = {} of AllowedKey => AllowedValue
    tuple.each do |k, v|
      if v.is_a?(NamedTuple)
        h[k] = make_hash(**v)
      else
        h[k] = v
      end
    end

    return h
  end
end
