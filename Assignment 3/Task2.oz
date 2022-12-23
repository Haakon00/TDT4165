declare Sum in

    fun {Sum List}
        case List
        of Head|Tail then
            Head + {Sum Tail}
        else
            0
        end
    end


    {Browse {Sum [1 2 3]}}