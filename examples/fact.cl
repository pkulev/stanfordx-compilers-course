
class Main inherits A2I {
   
   io: IO <-new IO;
   ps1: String <- ">>> ";
   ps2: String <- "> ";
   choise: Int;

   main() : Object { {
       io.out_string(ps2.concat("1 - iterative factorial, 2 - recursive.\n"));
       io.out_string(ps1);
       choise <- a2i(io.in_string());

       io.out_string(ps2.concat("Input number:\n"));
       io.out_string(ps1);
       let input: String <- io.in_string(),
       	   num: Int <- a2i(input),
	   fact: Int,
	   output: String <- ps2.concat("Factorial of ".concat(i2a(num)).concat(" is "))
       in {
	   if (choise = 1) then
	      fact <- ifact(num)
	   else if (choise = 2) then
	      fact <- rfact(num)
           else io.out_string("Choose factorial method (1 or 2)\n")
	   fi fi;	   
	   
	   io.out_string(output.concat(i2a(fact)).concat(".\n"));
	   }
  ; } };
   
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