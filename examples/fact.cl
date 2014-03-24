
class Main inherits A2I {
   
   io: IO <-new IO;
   prompt: String <- "--> ";
   choise: Int;

   main() : Object { {
       io.out_string("1 - iterative factorial, 2 - recursive.\n");
       io.out_string(prompt);
       choise <- a2i(io.in_string());
       let input: String <- io.in_string(),
       	   num: Int <- a2i,
	   fact: Int,
	   output: String <- "Factorial of ".concat(i2a(num)).concat(" is ")
       in {
	   if (choise = 1) then
	      fact <- a2i(ifact(num))
	   else if (choise = 2) then
	      fact <- a2i(rfact(num))
           else io.out_string("Choose factorial method (1 or 2)\n")
	   fi fi;	   
	   
	   io.out_string(output.concat(i2a(fact)).concat(".\n"));
	   }
   }; };
   
   ifact(i: Int): Int {
       let fact: Int <- 1 in {
           while (not (i = 0)) loop
               {
                   fact <- fact * i;
                   i <- i -1;
               }
           pool;
           fact;
       }       
   };
   
   rfact(i: Int): Int {
       if (i = 0) then 1 else i * rfact(i-1) fi
   };   
};