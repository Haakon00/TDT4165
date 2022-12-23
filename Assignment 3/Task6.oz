declare Sum Go in 
    fun {Sum List}
        {Go List 0}
    end


    fun {Go List A}
        case List
        of Head|Tail then
            {Go Tail A+Head}
        else
            A
        end
    end

{Browse {Sum [1 2 3]}}