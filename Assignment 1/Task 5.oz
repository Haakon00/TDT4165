local Circle in
   proc {Circle R} Diameter Area Circumference Pi in
      Pi = 355.0/113.0
      Diameter = R*2.0
      Area = Pi*R*R
      Circumference = Pi * Diameter
      {System.showInfo Diameter}
      {System.showInfo Area}
      {System.showInfo Circumference}
   end
   {Circle 3.0}
end
