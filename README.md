

    - A bug found in one of the gems, Active Model Serializers, freezed me for a long time and the 'workaround' was downgrade it's version for 0.10.0.rc4 like it is in Gemfile;
    - The rails 5 version introduced an API mode, that I used, that unfortunately made things more complicated to me when trying to create a pdf file using the helper function 'render_to_string' passing a template as parameter. The api mode has no templates and that method didn't work, after a lot of searching I found an workaround that uses the base rails form to call that render_to_string function.

