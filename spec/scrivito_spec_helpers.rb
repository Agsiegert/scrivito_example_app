module ScrivitoSpecHelpers
  def mock_obj(klass, attributes = {})
    obj = klass.new

    attributes.each do |name, value|
      # Attributes can be referenced as a method or a via hash key
      allow(obj).to receive(name).and_return(value)
      allow(obj).to receive(:[]).with(name).and_return(value)
    end

    obj
  end

  def mock_widget(klass, attributes = {})
    widget = klass.new

    attributes.each do |name, value|
      allow(widget).to receive(name).and_return(value)
      allow(widget).to receive(:[]).with(name).and_return(value)
    end

    widget
  end
end
