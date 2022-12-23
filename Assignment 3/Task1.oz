declare QuadraticEquation R1 A1 B1 R2 A2 B2 in

proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
    if B*B-4.0*A*C<0.0 then
        RealSol=false
    else
        RealSol=true

        X1 = (~B+{Sqrt (B*B-4.0*A*C)})/2.0/A
        X2 = (~B-{Sqrt (B*B-4.0*A*C)})/2.0/A
    end
end

{QuadraticEquation 2.0 1.0 ~1.0 R1 A1 B1}

{Browse R1#A1#B1}

{QuadraticEquation 2.0 1.0 2.0 R2 A2 B2}

{Browse R2#A2#B2}