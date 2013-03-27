class HelloReport < Prawn::Document
  def to_pdf
    text "Hello world"
    render_file
  end
end