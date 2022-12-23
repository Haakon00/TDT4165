declare RightFold Sum Length in

    fun {RightFold List Op U}
        case List
        of Head|Tail then
            {Op Head {RightFold Tail Op U}}

        else
            U
        end
    end

    Sum = fun {$ A B}
        A+B
    end

    Length = fun {$ A B}
        1+B
    end

    {Browse {RightFold [1 2 3 4] Sum 0}}

    {Browse {RightFold [1 2 3 4] Length 0}}


