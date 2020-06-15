# frozen_string_literal: true

require 'asciidoctor'
require_relative '../lib/asciidoctor/extensions/asciidoctor_kroki'

describe ::AsciidoctorExtensions::KrokiBlockProcessor do
  context 'convert to html5' do
    it 'should convert a PlantUML block to an image' do
      input = <<~'ADOC'
        [plantuml]
        ....
        alice -> bob: hello
        ....
      ADOC
      output = Asciidoctor.convert(input, standalone: false)
      (expect output).to eql %(<div class="imageblock kroki">
<div class="content">
<img src="https://kroki.io/plantuml/png/eNpLzMlMTlXQtVNIyk-yUshIzcnJBwA9iwZL" alt="Diagram">
</div>
</div>)
    end
  end
end
