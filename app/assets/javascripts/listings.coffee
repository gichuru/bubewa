jQuery ->
    $("#search-addon").click (event) ->
        $("#search-form").submit()
        event.preventDefault()
