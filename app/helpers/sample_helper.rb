module SampleHelper
  def sample_field(sample, name, label)
    "<li>
      <label>#{label}</label>: #{sample.send(name)}
    </li>"
  end

end
