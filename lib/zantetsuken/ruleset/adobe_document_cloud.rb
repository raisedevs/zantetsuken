# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    # Supports Adobe's Document Cloud PDF Embed API.
    class AdobeDocumentCloud < Base
      ruleset do
        self.script_src = 'https://documentcloud.adobe.com/view-sdk/'
        self.frame_src  = 'https://documentcloud.adobe.com/view-sdk/'
      end
    end
  end
end
