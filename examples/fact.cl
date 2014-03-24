
class Main inherits A2I {
   choise: Int;
   prompt: String <- "-->";

   main() : Object {
   {
       (new IO).out_string(prompt);
       (new IO).out_string(i2a(rfact(a2i((new IO).in_string()))).concat("\n"));
   };
   };
   
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