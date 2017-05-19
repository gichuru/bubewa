jQuery ->
    $(".close-review").click (event) ->
        $(this).parent().hide()
        $(".reviews-title").hide()
        $(".review-btn-container").show()

    $(".review-btn").click (event) ->
        $(this).parent().hide()
        $(".reviews-title").show()
        $(".review-form-container").show()

    $(".reward-btn").click (event) ->
        current = 0
        counter = [1..100]
        $(".progress").show()

        setTimeout () ->
            countToHundred(counter, current)
        , 30

        $(this).text("#{counter[current]}%")
        $('.progress-bar').css('width', "#{counter[current]}%")
        event.preventDefault()


    $("#search-addon").click (event) ->
        $("#search-form").submit()
        event.preventDefault()


    countToHundred = (counter, current) ->
        current = ++current % counter.length
        counterTimeout = null
        $(".reward-btn").text("#{counter[current]}%")
        $('.progress-bar').css('width', "#{counter[current]}%")

        counterTimeout = setTimeout () ->
            countToHundred counter, current
        , 30

        if current >= (counter.length - 1)
            $('.reward-btn').text('Succcess')
            $('.reward-btn').after('&nbsp;<a class="btn btn-default">check your email</a>')
            clearTimeout(counterTimeout)

    $("#claim-reward").click (event) ->
        current = 0
        element = this
        backgrounds = ['blue', 'green', 'yellow', 'red', 'purple']

        setTimeout () ->
            nextBackground(element, backgrounds, current)
        , 1000

        $(element).css('background-color', backgrounds[0])
        event.preventDefault()

    nextBackground = (element, backgrounds, current) ->
        current = ++current % backgrounds.length
        bgTimout = null
        $(element).css('background-color', backgrounds[current])

        bgTimout = setTimeout () ->
            nextBackground(element, backgrounds, current)
        , 1000

        if current >= (backgrounds.length - 1)
            clearTimeout(bgTimout)
