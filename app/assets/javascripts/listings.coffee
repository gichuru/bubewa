jQuery ->
    $(".close-review").click (event) ->
        $(this).parent().hide()
        $(".reviews-title").hide()
        $(".review-btn-container").show()

    $(".review-btn").click (event) ->
        $(this).parent().hide()
        $(".reviews-title").show()
        $(".review-form-container").show()

    $("#search-addon").click (event) ->
        $("#search-form").submit()
        event.preventDefault()
