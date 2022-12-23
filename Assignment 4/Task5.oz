declare HammerFactory HammerConsumer BoundedBuffer RandomInt in

    fun {RandomInt Min Max}
        X = {OS.rand}
        MinOS
        MaxOS
        in
        {OS.randLimits ?MinOS ?MaxOS}
        Min + X*(Max - Min) div (MaxOS - MinOS)
        end

    fun lazy {HammerFactory}
        {Delay 1000}
        if {RandomInt 1 100} =< 88 then
            working|{HammerFactory}
        else
            defect|{HammerFactory}
        end
    end
    

    fun {HammerConsumer HammerStream N}
        if N>0 then
            case HammerStream of Head|Tail then
                if Head==working then
                    1+{HammerConsumer Tail N-1}
                else
                    0+{HammerConsumer Tail N-1}
                end
            else
                0
            end
        else
            0
        end
    end

    fun {BoundedBuffer HammerStream N}
        if N>0 then /*Checks whether the desired buffer size is reached */
            case HammerStream
            of Head|Tail then
                Head|{BoundedBuffer Tail N-1} /*Creates a standard list with elements from the lazy stream through recursion */
            else
                nil
            end
        else
            {HammerFactory} /*When the the desired buffer size is reached, the function appends the lazy hammerstream to the end of the list */
        end
    end


    local HammerStream Buffer Consumer in
        HammerStream = {HammerFactory}
        Buffer = thread {BoundedBuffer HammerStream 6} end /*Had to fix the provided code to actually take advantage of the buffer through multi threading.*/
        {Delay 6000}
        Consumer = {HammerConsumer Buffer 10}
        {System.show Consumer}
    end

    local HammerStream Consumer in
        HammerStream = {HammerFactory}
        {Delay 6000}
        Consumer = {HammerConsumer HammerStream 10}
        {System.show Consumer}
        end
        