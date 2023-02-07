class Madlib
    @@madlib_url = ENV['MADLIB_URL']
    @adjective = nil
    @noun = nil
    @verb = nil
    @error = nil

    def initialize
        @words = get_words
        @madlib = "It was a #{@adjective} day. I went downstairs to see if I could #{@verb} dinner. I asked, \"Does the stew need fresh #{@noun}?\""
    end

    def madlib
        @madlib
    end

    def error
        @error
    end

    private

    def get_words
        words = {}

        words[:adjective] = get_adjective
        words[:noun] = get_noun
        words[:verb] = get_verb

        words
    end

    def get_adjective
        response = HTTP.get("#{@@madlib_url}/adjective")
        @adjective = handle_response(response)
    end

    def get_noun
        response = HTTP.get("#{@@madlib_url}/noun")
        @noun = handle_response(response)
    end

    def get_verb
        response = HTTP.get("#{@@madlib_url}/verb")
        @verb = handle_response(response)
    end

    def handle_response(response)
        unless response.status.success?
            # TODO: retry up to ten times
            #       if still failing raise custom error class
            @error = "Failed to fetch one or more madlib words with status code #{response.code}. Please try again."
        else
            return response.to_s.tr('"', '')
        end
    end
end
